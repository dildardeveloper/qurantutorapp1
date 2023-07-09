import 'package:flutter/material.dart';
import 'package:qurantutorapp/user/GoogleMap.dart';

class allowlocation extends StatelessWidget {
  const allowlocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/locallowimg.png",
                width: 150,
                height: 237,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Allow Quran Tutorto use\n your location",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "This app requires access to your\n location to match with the nearest\n Grocery Store! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff393939),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Container(
                  width: 236,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff3F48CC)),
                  child: Center(
                      child: Text(
                    "Allow",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Aref Ruqaa',
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 236,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xff3F48CC))),
                  child: Center(
                      child: Text(
                    "Allow while using app",
                    style: TextStyle(
                      color: Color(0xff3F48CC),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Aref Ruqaa',
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  // Perform action for "Don't Allow" button
                },
                child: Container(
                  width: 236,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xff3F48CC))),
                  child: Center(
                      child: Text(
                    "Don't Allow",
                    style: TextStyle(
                      color: Color(0xff3F48CC),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Aref Ruqaa',
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
