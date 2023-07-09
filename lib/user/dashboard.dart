import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff3F48CC),
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: "Rufina",
            color: Colors.white,
          ),
        ),
        leading: Image.asset("assets/img/Drawer.png"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 50,
              width: 440,
              color: Color(0xff3F48CC),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, top: 35),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return Users();
                      // }));
                    },
                    child: Container(
                      height: 130,
                      width: 130,
                      color: Color(0xffFFFFFF),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset("assets/student.png"),
                          SizedBox(
                            height: 40,
                          ),
                          Text("Students")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return Diseases();
                      // }));
                    },
                    child: Container(
                        height: 130,
                        width: 130,
                        color: Color(0xffFFFFFF),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset("assets/teacher.png"),
                            SizedBox(
                              height: 40,
                            ),
                            Text('Teachers')
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, top: 210),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return MyProfile();
                      // }));
                    },
                    child: Container(
                      height: 130,
                      width: 130,
                      color: Color(0xffFFFFFF),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset("assets/requestapprove.png"),
                          SizedBox(
                            height: 40,
                          ),
                          Text('Request Approvels'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return Help1();
                      // }));
                    },
                    child: Container(
                        height: 130,
                        width: 145,
                        color: Color(0xffFFFFFF),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset("assets/category.png"),
                            SizedBox(
                              height: 40,
                            ),
                            Text("Categories")
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
