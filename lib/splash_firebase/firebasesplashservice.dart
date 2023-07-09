import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/teacher/addservicedetail.dart';
import 'package:qurantutorapp/teacher/teacherprof.dart';
import 'package:qurantutorapp/user/bottomnavbar.dart';
import 'package:qurantutorapp/user/userlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class firebasesplashservice {
  islogin(BuildContext context) async {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userType = prefs.getString('user_type');
    if (user != null && userType == 'Student') {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => bottomnavbar()),
              ));
    } else if (user != null && userType == 'Teacher') {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => teacherprof()),
              ));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => userlogin()),
              ));
    }
  }
}
