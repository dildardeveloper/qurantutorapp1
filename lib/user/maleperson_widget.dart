import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/user/usertutorprofile.dart';

// ignore: must_be_immutable
class maleperson_widget extends StatefulWidget {
  String firstName;
  String LastName;
  String imageurl;
  String teacherid;
  String language;
  String about;
  String address;
  maleperson_widget(
      {super.key,
      required this.firstName,
      required this.imageurl,
      required this.LastName,
      required this.teacherid,
      required this.language,
      required this.about,
      required this.address});

  @override
  State<maleperson_widget> createState() => _maleperson_widgetState();
}

class _maleperson_widgetState extends State<maleperson_widget> {
  String category = '';
  String fph = '';
  String request = '';
  String addserviceid = '';
  String videoUrl = '';
  String videoUrl1 = '';
  String username = '';
  String userimageurl = '';
  String useraddress = '';

  final userid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    servicedata();
    userdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 62,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 8,
            color: Colors.grey.withOpacity(0.22),
          ),
        ],
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffFFFFFF),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => usertutorprofile(
                    firstName: widget.firstName,
                    LastName: widget.LastName,
                    imageurl: widget.imageurl,
                    about: widget.about,
                    address: widget.address,
                    language: widget.language,
                    category: category,
                    fph: fph,
                    teacherid: widget.teacherid,
                    // request: request,
                    addserviceid: addserviceid,
                    userid: userid,
                    videoUrl: videoUrl,
                    videoUrl1: videoUrl1,
                    username: username,
                    userimageurl: userimageurl,
                    useraddress: useraddress)),
          );
        },
        horizontalTitleGap: 5,
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5),
          child: widget.imageurl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageurl),
                  radius: 25, // adjust this value as needed
                )
              : CircleAvatar(
                  backgroundImage: AssetImage("assets/dp.jpg"),
                  radius: 25,
                ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.firstName == ''
                ? Text(
                    "Rahim Terry",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  )
                : Text(
                    widget.firstName,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
            SizedBox(
              height: 3,
            ),
            Text(
              category,
              style: TextStyle(
                color: Color(0xff8C8B8B),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                fontSize: 9,
                fontFamily: 'Segoe UI',
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/location1.png",
                      width: 8,
                      height: 9,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.address,
                      style: TextStyle(
                        color: Color(0xff8C8B8B),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 9,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    fph,
                    style: TextStyle(
                      color: Color(0xff3F48CC),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 13,
                      fontFamily: 'Aref Ruqaa',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // trailing: Text("data"),
      ),
    );
  }

  Future<void> servicedata() async {
    final DocumentSnapshot serviceDic = await FirebaseFirestore.instance
        .collection("addservice")
        .doc(widget.teacherid)
        .get();
    setState(() {
      category = serviceDic.get('category');
      fph = serviceDic.get('fph');

      /// request = serviceDic.get('status');
      addserviceid = serviceDic.get('addserviceid');
      videoUrl = serviceDic.get('videoUrl');
      videoUrl1 = serviceDic.get('videoUrl1');
    });
  }

  Future<void> userdata() async {
    final DocumentSnapshot serviceDic =
        await FirebaseFirestore.instance.collection("user").doc(userid).get();
    setState(() {
      username = serviceDic.get('firstName');
      userimageurl = serviceDic.get('imageurl');
      useraddress = serviceDic.get('address');
    });
  }
}
