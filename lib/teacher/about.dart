import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';

class about extends StatelessWidget {
  const about({super.key});

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
          "About",
          style: appbarcentertextstyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 37,
              ),
              Center(
                child: Image.asset(
                  "assets/splg.png",
                  color: Color(0xff2D328D),
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Text(
                "Help protect your website and its users with clear and fair\n website terms and conditions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Version",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                "2.1.0",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Powered by",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Qur’an & Arabic Tutor",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'Open Sans',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Contact us",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                ),
              ),
              SizedBox(
                height: 20,
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
        ),
      ),
    );
  }
}
