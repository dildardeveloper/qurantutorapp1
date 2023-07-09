import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/teacher/tearmcon.dart';
import 'package:qurantutorapp/user/userlogin.dart';

class teacherchangepassword extends StatefulWidget {
  const teacherchangepassword({super.key});

  @override
  State<teacherchangepassword> createState() => _teacherchangepasswordState();
}

class _teacherchangepasswordState extends State<teacherchangepassword> {
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmNew = TextEditingController();
  Future<void> changePassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = await _auth.currentUser;
    if (user == null) {
      // Handle user not signed in
      displayMessage('user not signed in');

      return;
    }
    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email ?? '',
      password: oldPassword.text,
    );
    try {
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword.text);
      displayMessage("password updated");
    } catch (error) {
      displayMessage(error.toString());
    }
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
            "Change Password",
            style: appbarcentertextstyle,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Image(
                        width: MediaQuery.of(context).size.width * 0.6,
                        image: AssetImage("assets/changepass.png"))),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 311,
                  height: 43,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    controller: oldPassword,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 18, right: 18),
                      hintStyle: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      fillColor: Colors.white.withOpacity(0.20),
                      filled: true,
                      hintText: "Old Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Old Password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 311,
                  height: 43,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    controller: newPassword,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 18, right: 18),
                      hintStyle: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      fillColor: Colors.white.withOpacity(0.20),
                      filled: true,
                      hintText: "New Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "New Password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 311,
                  height: 43,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    controller: confirmNew,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 18, right: 18),
                      hintStyle: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      fillColor: Colors.white.withOpacity(0.20),
                      filled: true,
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    changePassword();
                    FirebaseFirestore.instance
                        .collection('teacher')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      'password': newPassword.text,
                      'confirmpassword': confirmNew.text,
                    }).then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => userlogin()),
                      );
                    }).onError((error, stackTrace) {
                      displayMessage(error.toString());
                    });

                    // newPassword.clear();
                    // oldPassword.clear();
                    // confirmNew.clear();
                  },
                  child: Container(
                    width: 192,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: appcolor),
                    child: Center(
                      child: Text(
                        "Change Password",
                        style: buttiontextstyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
