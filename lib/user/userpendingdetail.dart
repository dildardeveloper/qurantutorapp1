import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class userpendingdetail extends StatefulWidget {
  String firstName;
  String LastName;
  String imageurl;
  String language;
  String teacherid;
  String address;
  String fph;
  String about;
  String category;
  String request;
  String requestid;
  String addserviceid;

  String username;
  String userimageurl;
  String useraddress;
  String userid;

  userpendingdetail(
      {super.key,
      required this.firstName,
      required this.LastName,
      required this.imageurl,
      required this.language,
      required this.teacherid,
      required this.address,
      required this.fph,
      required this.about,
      required this.category,
      required this.request,
      required this.requestid,
      required this.addserviceid,
      required this.username,
      required this.userimageurl,
      required this.useraddress,
      required this.userid});

  @override
  State<userpendingdetail> createState() => _userpendingdetailState();
}

class _userpendingdetailState extends State<userpendingdetail> {
  File? _imageprof;
  Uuid uuid = Uuid();

  @override
  void initState() {
    // userdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF5F5F5),
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 0,
        title: Text(
          "Tutor Profile",
          style: appbarcentertextstyle,
        ),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content: Container(
                    height: 200,
                    color: Color(0xffFFFFFF),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Share On",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Image.asset(
                                  "assets/facebook.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "facebook",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    fontFamily: 'Aref Ruqaa',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Image.asset(
                                  "assets/whatsapp.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "whatsapp",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    fontFamily: 'Aref Ruqaa',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Image.asset(
                                  "assets/twitter.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "twitter",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    fontFamily: 'Aref Ruqaa',
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Image.asset(
                                  "assets/instagram.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "instagram",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    fontFamily: 'Aref Ruqaa',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Image.asset(
                                  "assets/googlecontacts.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Contacts",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    fontFamily: 'Aref Ruqaa',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Image.asset(
                                  "assets/link.png",
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Copy link",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    fontFamily: 'Aref Ruqaa',
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Image.asset(
              "assets/share.png",
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              "assets/fv.png",
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.asset("assets/person.png"),
                  Positioned(
                    top: 83,
                    left: 150,
                    child: Image.asset(
                      "assets/lockgroup.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 15,
                    child: Image.asset(
                      "assets/Videoloc1.png",
                      width: 73,
                    ),
                  ),
                  Positioned(
                      right: 3,
                      top: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2, top: 4),
                        child: Text(
                          "Video Locked",
                          style: TextStyle(
                            color: Color(0xff3F48CC),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
                title: Text(
                  widget.firstName,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontFamily: 'Segoe UI',
                  ),
                ),
                subtitle: Text(
                  widget.about,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontFamily: 'Segoe UI',
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.imageurl),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(
                left: 10,
              ),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User Information",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 80,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xff044188).withOpacity(0.15),
                      ),
                      child: Center(
                        child: Text(
                          "REQUESTED",
                          style: TextStyle(
                            color: Color(0xff044188),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.address,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E1E1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.language,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E1E1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subject",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xffE1E1E1),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 18, right: 10, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      widget.fph + 'hr',
                      style: TextStyle(
                        color: Color(0xff3F48CC),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontFamily: 'Segoe UI',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 10, top: 9),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Segoe UI',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ExpandableText(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry dummyIpsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry dummy.Ipsum is simply dummy text of the printing and typesetting industry...see more',
                expandText: 'See more',
                collapseText: 'See less',
                maxLines: 2,
                linkColor: Color(0xff555555),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 10, top: 9),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "Add Payment Proof",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Segoe UI',
                ),
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xff039ECF).withOpacity(0.21)),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0xff039ECF).withOpacity(0.21),
                        radius: 35,
                        backgroundImage:
                            _imageprof == null ? null : FileImage(_imageprof!),
                      ),
                    ),
                    Center(
                        child: InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              await picker
                                  // ignore: deprecated_member_use
                                  .getImage(source: ImageSource.gallery)
                                  .then((value) {
                                setState(() {
                                  _imageprof = File(value!.path);
                                });
                              });
                            },
                            child: Icon(Icons.camera_alt_rounded)))
                  ],
                )),
            SizedBox(
              height: 7,
            ),
            Text(
              "Add Screen shot",
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                fontSize: 12,
                fontFamily: 'Segoe UI',
              ),
            ),
            SizedBox(
              height: 38,
            ),
            InkWell(
              onTap: () {
                Reference reference = FirebaseStorage.instance
                    .ref()
                    .child('user')
                    .child(uuid.v4().toString());
                UploadTask task = reference.putFile(_imageprof!);
                task.whenComplete(() {
                  reference.getDownloadURL().then((imgurl) {
                    var _imageprof = imgurl;
                    FirebaseFirestore.instance
                        .collection('request')
                        .doc(widget.requestid)
                        .update({
                      'username': widget.username,
                      'teacherid': widget.teacherid,
                      'userid': widget.userid,
                      "paymentproof": _imageprof,
                      'userimageurl': widget.userimageurl
                    }).then((value) {
                      final notificationid = uuid.v4().toString();
                      FirebaseFirestore.instance
                          .collection("notification")
                          .doc(notificationid)
                          .set({
                        'username': widget.username,
                        'teacherid': widget.teacherid,
                        'userid': widget.userid,
                        'subject': 'Request Approvel',
                        'notiicationid': notificationid,
                      });
                      print("account");
                      displayMessage(
                          "payment proof send into Adimn please wait");
                      Navigator.pop(context);
                    }).onError((error, stackTrace) {
                      displayMessage(error.toString());
                    });
                  });
                });
              },
              child: Container(
                width: 211,
                height: 43,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff3F48CC)),
                child: Center(
                    child: Text(
                  "Send",
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
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> userdata() async {
  //   final DocumentSnapshot serviceDic = await FirebaseFirestore.instance
  //       .collection("user")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     username = serviceDic.get('firstName');
  //   });
  // }
}
