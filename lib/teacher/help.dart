import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class help extends StatefulWidget {
  String teacherimageurl;
  String teachername;
  String teacherid;
  String phone;
  help(
      {super.key,
      required this.teacherimageurl,
      required this.teachername,
      required this.teacherid,
      required this.phone});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController descController = TextEditingController();
  final helpid = Uuid().v1();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 1,
        title: Text(
          "Help",
          style: appbarcentertextstyle,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 345,
              height: 390,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 6,
                      color: Colors.grey.withOpacity(0.20),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.9)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Help",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 310,
                    // color: Colors.black,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextFormField(
                      controller: nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 3, left: 5),
                          hintStyle: TextStyle(
                            color: Color(0xff7D7D7D),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                          ),
                          // fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          hintText: "Your Name",
                          fillColor: Color(0xffFFFFFFF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(4),
                          )),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 310,
                    // color: Colors.black,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 3, left: 5),
                          hintStyle: TextStyle(
                            color: Color(0xff7D7D7D),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                          ),
                          // fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          hintText: "Your Email",
                          fillColor: Color(0xffFFFFFFF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(4),
                          )),
                    ),
                  ),
                  Container(
                    width: 310,
                    height: 125,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextFormField(
                      controller: descController,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 3, left: 5),
                          hintStyle: TextStyle(
                            color: Color(0xff7D7D7D),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                          ),
                          // fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          fillColor: Color(0xffFFFFFFF),
                          hintText: "Description",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(4),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Container(
                    height: 45,
                    width: 174,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff3F48CC),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff3F48CC).withOpacity(0.5),
                          // spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          if (nameController.text.isEmpty) {
                            displayMessage(" Enter Your  Name");
                          } else if (emailController.text.isEmpty) {
                            displayMessage(" Enter Your Email");
                          } else if (descController.text.isEmpty) {
                            displayMessage(" Enter Your Description");
                          } else {
                            FirebaseFirestore.instance
                                .collection('help')
                                .doc(helpid)
                                .set({
                                  'teacherid': widget.teacherid,
                                  'name': nameController.text,
                                  'email': emailController.text,
                                  'desc': descController.text,
                                  'helpid': helpid,
                                  'status': 'help',
                                  'firstname': widget.teachername,
                                  'userimageurl': widget.teacherimageurl,
                                  'phone': widget.phone
                                })
                                .then((value) => {
                                      FirebaseFirestore.instance
                                          .collection('notification')
                                          .doc(helpid)
                                          .set({
                                        'subject': 'Help',
                                        'message': 'sent help alert.',
                                        'notificationid': helpid,
                                        'userid': FirebaseAuth
                                            .instance.currentUser!.uid,
                                        'username': nameController.text,
                                        'notifications': 'true',
                                      }),
                                      displayMessage('help send successfully')
                                    })
                                .onError((error, stackTrace) =>
                                    {displayMessage(error.toString())});
                          }
                          emailController.clear();
                          descController.clear();
                          nameController.clear();
                        },
                        child: Text(
                          "Send",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontFamily: 'Aref Ruqaa',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              width: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "We Are Available On",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    leading: Image.asset("assets/map.png"),
                    title: Text(
                      "www.Qur’an&arabictutor.com",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    leading: Image.asset("assets/mail.png"),
                    title: Text(
                      "www.Qur’an&arabictutor.com",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
