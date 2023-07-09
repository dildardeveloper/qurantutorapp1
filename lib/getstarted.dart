import 'package:flutter/material.dart';
import 'package:qurantutorapp/teacher/teachersignup.dart';
import 'package:qurantutorapp/user/usersignup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getstarted extends StatefulWidget {
  // final userid;
  const getstarted({
    super.key,
  });

  @override
  State<getstarted> createState() => _getstartedState();
}

class _getstartedState extends State<getstarted> {
  String? user;
  String? provider = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/splg.png",
                    color: Color(0xff2D328D),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "I am a:",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 22,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Color(0xff3F48CC),
                  title: Text(
                    'Student',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  value: "Student",
                  groupValue: provider,
                  onChanged: (value) {
                    setState(() {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text(value.toString())));
                      provider = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Color(0xff3F48CC),
                  title: Text(
                    'Teacher',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  value: "Teacher",
                  groupValue: provider,
                  onChanged: (value) {
                    setState(() {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text(value.toString())));
                      provider = value.toString();
                    });
                  },
                ),
                SizedBox(
                  height: 110,
                ),
                TextButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('user_type', provider!);

                    //              SharedPref.instance
                    // .getBooleanValue(provider!)
                    // .then((value) => setState(() {
                    //       if (value) {
                    //         Navigator.of(context).pushReplacementNamed(provider!);
                    //       } else {
                    //         Navigator.of(context).pushReplacementNamed(provider!);
                    //       }
                    //     }));
                    (provider == "Student")
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => usersignup()),
                          )
                        : (provider == "Teacher")
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => teachersignup()),
                              )
                            : "";
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff3F48CC),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: provider == ''
                            ? Text(
                                "Next",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontFamily: 'Aref Ruqaa',
                                ),
                              )
                            : Text(
                                //provider!,
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
