import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/user/userlogin.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});
  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future resetPassword(
      {required String email, required BuildContext context}) async {
    await auth
        .sendPasswordResetEmail(email: _emailController.text)
        .then((value) {
      displayMessage("please check the email and reset the password");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => userlogin()),
      );
    }).catchError((e) {
      displayMessage(e.toString());
    });
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password",
                    style: toptextstyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your email to recover your password ",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
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
                    controller: _emailController,
                    obscureText: false,
                    decoration: InputDecoration(
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
                SizedBox(
                  height: 130,
                ),
                Container(
                  height: 47,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: appcolor),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        resetPassword(
                            context: context,
                            email: _emailController.text.trim());
                        print("object");
                      },
                      child: Text(
                        "Send",
                        style: buttiontextstyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
