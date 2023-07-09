import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/teacher/teachercreateprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class verification extends StatefulWidget {
  String firstname = '';
  String lastname = '';
  String email = '';
  String confirmpassword = '';
  String password = '';
  verification(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.password,
      required this.confirmpassword});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _otpTextController =
      TextEditingController(text: '');
  String savedOTP = '';
  @override
  void initState() {
    print(widget.email);
    sendOtpCode();
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Verification",
                  style: toptextstyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the OTP code sent to your email  ",
                  style: TextStyle(
                    color: Color(0xff646464),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Pinput(
                  textInputAction: TextInputAction.next,
                  controller: _otpTextController,
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  closeKeyboardWhenCompleted: true,
                  defaultPinTheme: PinTheme(
                    margin: EdgeInsets.all(8),
                    height: 45,
                    width: 45,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff3F48CC),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff3F48CC),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    loadValue("otp2");
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Did not receive a code?",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xff646464),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  "RESEND",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: appcolor,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  loadValue("otp2");
                  if (_otpTextController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('please fill otp'),
                      ),
                    );
                  } else if (_otpTextController.text == savedOTP) {
                    _UploadDataToFirebase();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Otp can,t be matched'),
                      ),
                    );
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => createprofile(
                  //             adminid: FirebaseAuth.instance.currentUser!.uid,
                  //           )),
                  // );
                },
                child: Container(
                  height: 47,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: appcolor),
                  child: Center(
                    child: Text(
                      "Done",
                      style: buttiontextstyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _UploadDataToFirebase() async {
    showProgressindicator();
    try {
      await _auth.createUserWithEmailAndPassword(
        email: widget.email.toString().trim(),
        password: widget.password.toString().trim(),
      );
      final teacherid = FirebaseAuth.instance.currentUser!.uid;
      // final User? user = _auth.currentUser;
      // final useruid = user!.uid;
      FirebaseFirestore.instance.collection('teacher').doc(teacherid).set({
        'teacherid': teacherid,
        'firstName': widget.firstname,
        'LastName': widget.lastname,
        'email': widget.email,
        'password': widget.password,
        'confirmpassword': widget.confirmpassword,
      }).then((value) => {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return teachercreateprofile(teacherid: teacherid);
            }))
          });
      // Navigator.canPop(context) ? Navigator.pop(context) : null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void showProgressindicator() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Color(0xffD8543B),
          ),
        );
      },
    );
  }

  Future<void> sendOtpCode() async {
    String otp = generateOTP();
    Map<String, String> body = {
      'to': widget.email,
      'message': "Hey " +
          "${widget.firstname} ${widget.lastname}" +
          ", you're almost ready to start enjoying  panto. Simply Copy this code " +
          otp +
          " and paste in your  App for signup completion ",
      'subject': 'admin'
    };

    final response = await http.post(
        Uri.parse(
            "https://apis.appistaan.com/mailapi/index.php?key=sk286292djd926d"),
        body: body);

    print(response);

    if (response.statusCode == 200) {
      saveValue('otp2', otp);

      print(otp);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('otp send successfully')));
    }
  }

  Future<void> saveValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> loadValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedOTP = prefs.getString(key)!;
      print(savedOTP);
    });
  }

  String generateOTP() {
    int length = 4; // Length of the OTP
    String characters = '0123456789'; // Characters to use for the OTP
    String otp = '';
    for (int i = 0; i < length; i++) {
      otp += characters[Random().nextInt(characters.length)];
    }
    return otp;
  }
}
