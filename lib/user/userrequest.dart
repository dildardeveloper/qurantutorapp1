import 'package:flutter/material.dart';
import 'package:qurantutorapp/user/userapproved.dart';
import 'package:qurantutorapp/user/userpending.dart';
import 'package:qurantutorapp/user/userrejected.dart';

class userrequest extends StatefulWidget {
  const userrequest({
    super.key,
  });

  @override
  State<userrequest> createState() => _userrequestState();
}

class _userrequestState extends State<userrequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                // Implement notification functionality
              },
            ),
          ],
          title: Text(
            "Requests",
            style: TextStyle(
              color: Color(0xff3F48CC),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontSize: 20,
              fontFamily: 'Aref Ruqaa',
            ),
          ),
          titleSpacing: 0,
          backgroundColor: Color(0xffFFFFFF),
          leading: IconButton(
            icon: Image.asset("assets/drawe.png"),
            onPressed: () {},
          ),
          // title: Text(
          //   "Power in Excellence",
          //   style: appbartextstyle,
          // ),
          // actions: [
          //   notificationbudge(
          //     text: '',
          //     iconData: Icons.notifications,
          //     notificationCount: 0,
          //     onTap: () {
          //       print("object");
          //     },
          //   ),
          // ],
          elevation: 0,
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                SizedBox(
                  height: 23,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff3F48CC).withOpacity(0.13)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 5, top: 5),
                    child: Container(
                      // width: 103,
                      // height: 30,
                      child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xff3F48CC)),
                        automaticIndicatorColorAdjustment: true,
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xff3F48CC),
                        tabs: [
                          Tab(
                            child: Text(
                              "Pending",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Aref Ruqaa',
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Rejected",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Aref Ruqaa',
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Approved",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Aref Ruqaa',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [
                  userpending(),
                  userrejected(),
                  userapproved(),
                ]))
              ],
            )));
  }
}
