import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'teacher/splashscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

displayMessage(String Message) {
  Fluttertoast.showToast(
    msg: Message,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 2,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
