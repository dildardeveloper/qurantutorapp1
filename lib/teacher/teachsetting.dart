import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/teacher/about.dart';
import 'package:qurantutorapp/teacher/help.dart';
import 'package:qurantutorapp/teacher/privacy.dart';
import 'package:qurantutorapp/teacher/teacherchangepassword.dart';
import 'package:qurantutorapp/teacher/tearmcon.dart';

// ignore: must_be_immutable
class teachsetting extends StatefulWidget {
  String teacherimageurl;
  String teachername;
  String teacherid;
  String phone;

  teachsetting(
      {super.key,
      required this.teacherimageurl,
      required this.teachername,
      required this.phone,
      required this.teacherid});

  @override
  State<teachsetting> createState() => _teachsettingState();
}

class _teachsettingState extends State<teachsetting> {
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
          "Settings",
          style: appbarcentertextstyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => teacherchangepassword()),
                );
              },
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset("assets/changepassword.png"),
              ),
              title: Text(
                "Change Password",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermConditions()),
                );
              },
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset("assets/term.png"),
              ),
              title: Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => privacy()),
                );
              },
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset("assets/privacy.png"),
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => help(
                            teacherimageurl: widget.teacherimageurl,
                            teachername: widget.teachername,
                            teacherid: widget.teacherid,
                            phone: widget.phone,
                          )),
                );
              },
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset("assets/help.png"),
              ),
              title: Text(
                "Help",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => about()),
                );
              },
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.20),
                ),
                child: Image.asset("assets/about.png"),
              ),
              title: Text(
                "About",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Segoe UI',
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
