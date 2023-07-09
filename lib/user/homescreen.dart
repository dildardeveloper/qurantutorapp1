import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/teacher/teacherlogin.dart';
import 'package:qurantutorapp/user/femaleperson_widget.dart';

import 'package:qurantutorapp/user/maleperson_widget.dart';
import 'package:qurantutorapp/user/userhelp.dart';

import 'package:qurantutorapp/user/userfavorite.dart';
import 'package:qurantutorapp/user/userlogin.dart';

import 'package:qurantutorapp/user/usernotificationsetting.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController _controller = TextEditingController();
  final auth = FirebaseAuth.instance;

  bool _expanded = false;
  String search = "";

  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
      if (!_expanded) {
        _controller.clear();
        search = '';
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // blockuser();
  }

  // Future<void> blockuser() async {
  //   DocumentReference docRef = FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(FirebaseAuth.instance.currentUser!.uid);

  //   try {
  //     DocumentSnapshot docSnapshot = await docRef.get();
  //     setState(() {
  //       String status = docSnapshot['status'];
  //       if (status == 'blockuser') {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => userlogin()),
  //         );
  //       }
  //     });

  //     // Display the message after the function completes
  //     if (docSnapshot['status'] == 'blockuser') {
  //       displayMessage("Your Block please contact to Admin");
  //     }
  //   } catch (e) {
  //     // Handle any errors
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: _toggleExpand,
                child: _expanded
                    ? Icon(
                        Icons.clear,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('notifications')
                  .where('userid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userDocs = snapshot.data!.docs;
                  if (userDocs.isEmpty) {
                    // Show the bill icon if userDocs list is empty
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => usernotificationsetting(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/notification1.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    );
                  }
                  return Container(
                    width: 24,
                    child: ListView.builder(
                      itemCount: userDocs.length,
                      itemBuilder: (context, index) {
                        final userData =
                            userDocs[index].data() as Map<String, dynamic>;
                        final notifications = userData['notifications'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => usernotificationsetting(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: Image.asset(
                              "assets/notification1.png",
                            ),
                          ),
                          // child: notifications == "true"
                          //     ? Image.asset(
                          //         "assets/notification.png",
                          //         height: 50,
                          //       )
                          //     : Padding(
                          //         padding: const EdgeInsets.only(top: 18),
                          //         child: Icon(
                          //           Icons.notifications_rounded,
                          //           size: 25,
                          //           color: Colors.black,
                          //         ),
                          //       ),
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            )
          ],
          title: _expanded
              ? TextField(
                  controller: _controller,
                  onChanged: (val) {
                    setState(() {
                      search = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // suffixIcon: IconButton(
                    //   icon: Icon(Icons.clear),
                    //   onPressed: () {
                    //     setState(() {
                    //       _controller.clear();
                    //       search = '';
                    //     });
                    //   },
                    // ),
                  ),
                )
              : Text(
                  "Home",
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
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
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
        drawer: Drawer(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .where("userid",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final firstName =
                              snapshot.data?.docs[index]['firstName'];
                          final imageurl =
                              snapshot.data?.docs[index]['imageurl'];
                          final phone = snapshot.data?.docs[index]['phone'];
                          final userid = snapshot.data?.docs[index]['userid'];
                          final email = snapshot.data?.docs[index]['email'];
                          //  final status = snapshot.data?.docs[index]['status'];

                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 160,
                                decoration: BoxDecoration(
                                    // color: AppColors.BlueColor,
                                    borderRadius: BorderRadius.only(
                                        // topLeft: Radius.circular(20.0),
                                        // topRight: Radius.circular(20.0),
                                        ),
                                    color: appcolor),
                                child: ListTile(
                                  // horizontalTitleGap: 0,
                                  leading: CircleAvatar(
                                    maxRadius: 30,
                                    backgroundImage: NetworkImage(imageurl),
                                  ),
                                  title: Text(
                                    firstName,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: 15),
                                    ),
                                  ),
                                  subtitle: Text(
                                    email,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                horizontalTitleGap: 0,
                                leading: Image.asset("assets/home.png"),
                                title: Text(
                                  "Home",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff3B3A43),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                              ListTile(
                                horizontalTitleGap: 0,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => userfavorite()),
                                  );
                                },
                                leading: Image.asset(
                                  "assets/Favorite.png",
                                  width: 20,
                                  height: 24,
                                ),
                                title: Text(
                                  "Favorite",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff3B3A43),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                              ListTile(
                                horizontalTitleGap: 0,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => userhelp(
                                              firstname: firstName,
                                              imageurl: imageurl,
                                              phone: phone,
                                              userid: userid,
                                            )),
                                  );
                                },
                                leading: Image.asset("assets/about.png"),
                                title: Text(
                                  "about",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff3B3A43),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              ListTile(
                                horizontalTitleGap: 0,
                                onTap: () {
                                  auth.signOut().then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => userlogin()),
                                    );
                                  });
                                },
                                leading: Image(
                                    width: 20,
                                    height: 20,
                                    image: AssetImage("assets/logout1.png")),
                                title: Text(
                                  "Logout",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff3B3A43),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
        body: DefaultTabController(
            length: 2,
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
                              "Male",
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
                              "Female",
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
                  StreamBuilder(
                      stream: (search != "" && search != '')
                          ? FirebaseFirestore.instance
                              .collection('teacher')
                              .where("firstName",
                                  isGreaterThanOrEqualTo: search)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('teacher')
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final Docs = snapshot.data!.docs;
                          if (Docs.isEmpty) {
                            return Center(
                              child: Text('Teacher not found'),
                            );
                          }
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final firstName =
                                    snapshot.data!.docs[index]['firstName'];
                                final LastName =
                                    snapshot.data!.docs[index]['LastName'];
                                final imageurl =
                                    snapshot.data!.docs[index]['imageurl'];

                                final language =
                                    snapshot.data!.docs[index]['language'];

                                final teacherid =
                                    snapshot.data!.docs[index]['teacherid'];
                                final address =
                                    snapshot.data!.docs[index]['address'];
                                final gender =
                                    snapshot.data!.docs[index]['gender'];
                                final about =
                                    snapshot.data!.docs[index]['about'];

                                if (gender == 'Male') {
                                  return Container(
                                    child: maleperson_widget(
                                        firstName: firstName,
                                        imageurl: imageurl,
                                        LastName: LastName,
                                        language: language,
                                        teacherid: teacherid,
                                        about: about,
                                        address: address),
                                  );
                                } else {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "no data found",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                  StreamBuilder(
                      stream: (search != "" && search != '')
                          ? FirebaseFirestore.instance
                              .collection('teacher')
                              .where("firstName",
                                  isGreaterThanOrEqualTo: search)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('teacher')
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final Docs = snapshot.data!.docs;
                          if (Docs.isEmpty) {
                            return Center(
                              child: Text('Teacher not found'),
                            );
                          }
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final firstName =
                                    snapshot.data!.docs[index]['firstName'];
                                final LastName =
                                    snapshot.data!.docs[index]['LastName'];
                                final imageurl =
                                    snapshot.data!.docs[index]['imageurl'];

                                final language =
                                    snapshot.data!.docs[index]['language'];

                                final teacherid =
                                    snapshot.data!.docs[index]['teacherid'];
                                final address =
                                    snapshot.data!.docs[index]['address'];
                                final gender =
                                    snapshot.data!.docs[index]['gender'];
                                final about =
                                    snapshot.data!.docs[index]['about'];

                                if (gender == 'Female') {
                                  return Container(
                                    child: femaleperson_widget(
                                        firstName: firstName,
                                        imageurl: imageurl,
                                        LastName: LastName,
                                        language: language,
                                        teacherid: teacherid,
                                        about: about,
                                        address: address),
                                  );
                                } else {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "no data found",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ]))
              ],
            )));
  }
}
