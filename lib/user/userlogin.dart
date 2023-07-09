import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/getstarted.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/teacher/teacherprof.dart';
import 'package:qurantutorapp/user/bottomnavbar.dart';
import 'package:qurantutorapp/user/forgotpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userlogin extends StatefulWidget {
  const userlogin({super.key});

  @override
  State<userlogin> createState() => _userloginState();
}

class _userloginState extends State<userlogin> {
  String userType = '';
  // final formkey = GlobalKey<FormState>();

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xffFFFFFF),
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Login",
                    style: toptextstyle,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image(image: AssetImage("assets/applogo1.png")),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome back!",
                style: wellcstatextstyle,
              ),
              SizedBox(
                height: 45,
              ),
              Column(
                children: [
                  Container(
                    height: 47,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 8,
                          color: Colors.grey.withOpacity(0.15),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        hintStyle: TextStyle(
                          color: Color(0xff909090),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        fillColor: Colors.white.withOpacity(0.20),
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    suffixIcon:
                        Icon(Icons.remove_red_eye_outlined, color: appcolor),
                    hintStyle: TextStyle(
                      color: Color(0xff909090),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => forgotpassword()),
                  );
                },
                child: Container(
                  height: 47,
                  width: 280,
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: appcolor),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      loginUser();
                    },

                    // SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // String? userType = prefs.getString('user_type');

                    // _auth
                    //     .signInWithEmailAndPassword(
                    //         email: _emailController.text,
                    //         password: _passwordController.text)
                    //     .then((value) {
                    //   print("object");
                    //   displayMessage("Login successful");
                    //   Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (_) => bottomnavbar()))
                    //       .onError((error) {
                    //     displayMessage(error.toString());
                    //   });
                    // });
                    // if (userType == 'student') {
                    //   _auth
                    //       .signInWithEmailAndPassword(
                    //           email: _emailController.text,
                    //           password: _passwordController.text)
                    //       .then((value) {
                    //     print("object");
                    //     displayMessage("Login successful");
                    //     Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (_) => bottomnavbar()))
                    //         .onError((error, stackTrace) {
                    //       displayMessage(error.toString());
                    //     });
                    //   });
                    // } else {
                    //   _auth
                    //       .signInWithEmailAndPassword(
                    //           email: _emailController.text,
                    //           password: _passwordController.text)
                    //       .then((value) {
                    //     print("object");
                    //     displayMessage("Login successful");
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (_) => teacherprof(
                    //                   servicesid: '',
                    //                 ))).onError((error, stackTrace) {
                    //       displayMessage(error.toString());
                    //     });
                    //   });
                    // }

                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            "Login",
                            style: buttiontextstyle,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account  |',
                      style: buttomgrytextstyle,
                    ),
                    TextSpan(
                      text: ' Signup',
                      style: buttomorangetextstyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => getstarted()),
                              )
                            },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      displayMessage('Please enter Email and Password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final userSnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where("email", isEqualTo: _emailController.text)
          .get();

      final teacherSnapshot = await FirebaseFirestore.instance
          .collection('teacher')
          .where("email", isEqualTo: _emailController.text)
          .get();

      bool accountFound = false;

      for (final doc in userSnapshot.docs) {
        final email = doc['email'];
        final password = doc['password'];
        if (email == _emailController.text &&
            password == _passwordController.text) {
          await _auth.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          accountFound = true;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_type', 'Student');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => bottomnavbar()),
          );
          break;
        }
      }

      if (!accountFound) {
        for (final doc in teacherSnapshot.docs) {
          final email = doc['email'];
          final password = doc['password'];
          if (email == _emailController.text &&
              password == _passwordController.text) {
            await _auth.signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );
            accountFound = true;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('user_type', 'Teacher');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => teacherprof()),
            );
            break;
          }
        }
      }

      if (!accountFound) {
        displayMessage("Account not found.");
        return;
      }

      displayMessage('Login Success');
      // showConfirmationDialog();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        displayMessage('No Record Found.');
      } else if (e.code == 'wrong-password') {
        displayMessage('Wrong password provided for that user.');
      } else {
        displayMessage('Login failed. Please try again.');
      }
    } catch (e) {
      displayMessage('Login failed. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // void _signInWithEmailAndPassword() async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //   } catch (e) {
  //     displayMessage('Login failed. Please try again.');
  //   }
  // }

  // void showConfirmationDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text('Login Success'),
  //       content: Text('You have successfully logged in.'),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (_) => bottomnavbar()),
  //             );
  //           },
  //           child: Text('Ok'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  bool _isLoading = false;
}
