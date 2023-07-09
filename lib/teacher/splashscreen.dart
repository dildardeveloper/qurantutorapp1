import 'package:flutter/material.dart';
import 'package:qurantutorapp/splash_firebase/firebasesplashservice.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 3),
  //       () => Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => getstarted()),
  //           ));
  // }
  firebasesplashservice firebasesplashScreen = firebasesplashservice();
  @override
  void initState() {
    super.initState();
    firebasesplashScreen.islogin(context);
    // splashscreen.navigationPage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3F48CC),
      body: Container(
        child: Center(child: Image(image: AssetImage("assets/splg.png"))),
      ),
    );
  }
}
