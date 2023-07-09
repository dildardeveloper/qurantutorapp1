import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/user/userrequest.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class usertutorprofile extends StatefulWidget {
  String firstName;
  String LastName;
  String imageurl;
  String about;
  String address;
  String language;
  String category;
  String fph;
  String teacherid;
  //String request;
  String userid;
  String addserviceid;
  String videoUrl;
  String videoUrl1;
  String username;
  String userimageurl;
  String useraddress;
  usertutorprofile({
    super.key,
    required this.firstName,
    required this.LastName,
    required this.imageurl,
    required this.about,
    required this.address,
    required this.language,
    required this.category,
    required this.fph,
    required this.teacherid,
    // required this.request,
    required this.addserviceid,
    required this.userid,
    required this.videoUrl,
    required this.videoUrl1,
    required this.username,
    required this.userimageurl,
    required this.useraddress,
  });

  @override
  State<usertutorprofile> createState() => _usertutorprofileState();
}

class _usertutorprofileState extends State<usertutorprofile> {
  final requestid = Uuid().v1();

  @override
  Widget build(BuildContext context) {
    void BottomSheetOK(BuildContext context) {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Divider(
                        thickness: 4,
                        indent: 150,
                        endIndent: 150,
                        color: Color(0xffC7C7C7),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Center(
                        child: Text(
                          "Thank you for Request!",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                            fontSize: 18,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "First, you pay 20 dollars to the admin, and then he will accept your request.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff434343),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontFamily: 'Segoe UI',
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Text(
                        "Account Name",
                        style: TextStyle(
                          color: Color(0xff434343),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          fontFamily: 'Archivo',
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Alax_jack9986",
                        style: TextStyle(
                          color: Color(0xff777777),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          fontFamily: 'Archivo',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Account Number",
                        style: TextStyle(
                          color: Color(0xff434343),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          fontFamily: 'Archivo',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: "0314657687366631"));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied to clipboard')),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffC7C7C7)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("0314657687366631"),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/copy.png",
                                      width: 16,
                                      height: 19,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Copy",
                                      style: TextStyle(
                                        color: Color(0xff3081CA),
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        fontFamily: 'Archivo',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: "0314657687366631"));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied to clipboard')),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffC7C7C7)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("0314657687366631"),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/copy.png",
                                      width: 16,
                                      height: 19,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Copy",
                                      style: TextStyle(
                                        color: Color(0xff3081CA),
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        fontFamily: 'Archivo',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('request')
                              .doc(requestid)
                              .set({
                                'firstName': widget.firstName,
                                'LastName': widget.LastName,
                                'imageurl': widget.imageurl,
                                'about': widget.about,
                                'address': widget.address,
                                'language': widget.language,
                                'category': widget.category,
                                'fph': widget.fph,
                                'teacherid': widget.teacherid,
                                'request': 'pending',
                                'paymentproof':'',
                                'addserviceid': widget.addserviceid,
                                'userid': widget.userid,
                                'requestid': requestid,
                                'videoUrl': widget.videoUrl,
                                'videoUrl1': widget.videoUrl1,
                                'requestdate': DateTime.now(),
                                'username': widget.username,
                                'userimageurl': widget.userimageurl,
                                'useraddress': widget.useraddress,
                              })
                              .then((value) => {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return userrequest();
                                    }))
                                  })
                              .onError((error, stackTrace) =>
                                  {displayMessage(error.toString())});
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (_) {

//                             return userrequest(

//                             );
//                           }));
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 145,
                            height: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: appcolor),
                            child: Center(
                              child: Text(
                                "Done",
                                style: buttiontextstyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          });
    }

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
            Column(
              children: [
                // widget.request == 'lock'
                //     ? Container(
                //         width: MediaQuery.of(context).size.width,
                //         // height: MediaQuery.of(context).size.height,
                //         child: Stack(
                //           children: [
                //             Image.asset("assets/person.png"),
                //             Positioned(
                //               top: 83,
                //               left: 150,
                //               child: Image.asset(
                //                 "assets/lockgroup.png",
                //                 width: 30,
                //                 height: 30,
                //               ),
                //             ),
                //             Positioned(
                //               right: 0,
                //               top: 15,
                //               child: Image.asset(
                //                 "assets/Videoloc1.png",
                //                 width: 73,
                //               ),
                //             ),
                //             Positioned(
                //                 right: 3,
                //                 top: 15,
                //                 child: Padding(
                //                   padding:
                //                       const EdgeInsets.only(right: 2, top: 4),
                //                   child: Text(
                //                     "Video Locked",
                //                     style: TextStyle(
                //                       color: Color(0xff3F48CC),
                //                       fontWeight: FontWeight.w600,
                //                       decoration: TextDecoration.none,
                //                       fontSize: 10,
                //                       fontFamily: 'Segoe UI',
                //                     ),
                //                   ),
                //                 )),
                //           ],
                //         ),
                //       )
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
              ],
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
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 15),
                  //   child: Container(
                  //     width: 80,
                  //     height: 23,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(3),
                  //       color: Color(0xff044188).withOpacity(0.15),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "REQUESTED",
                  //         style: TextStyle(
                  //           color: Color(0xff044188),
                  //           fontWeight: FontWeight.w600,
                  //           decoration: TextDecoration.none,
                  //           fontSize: 12,
                  //           fontFamily: 'Segoe UI',
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
            // SizedBox(
            //   height: 12,
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 36,
            //   padding: EdgeInsets.only(left: 10, top: 9),
            //   color: Color(0xffC4C4C4).withOpacity(0.30),
            //   child: Text(
            //     "Add Payment Proof",
            //     style: TextStyle(
            //       color: Color(0xff000000),
            //       fontWeight: FontWeight.w600,
            //       decoration: TextDecoration.none,
            //       fontSize: 16,
            //       fontFamily: 'Segoe UI',
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 31,
            // ),
            // Container(
            //     width: 110,
            //     height: 110,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(7),
            //         color: Color(0xff039ECF).withOpacity(0.21)),
            //     child: Center(child: Icon(Icons.camera_alt_rounded))),
            // SizedBox(
            //   height: 7,
            // ),
            // Text(
            //   "Add Screen shot",
            //   style: TextStyle(
            //     color: Color(0xff000000),
            //     fontWeight: FontWeight.w400,
            //     decoration: TextDecoration.none,
            //     fontSize: 12,
            //     fontFamily: 'Segoe UI',
            //   ),
            // ),
            SizedBox(
              height: 38,
            ),
            InkWell(
              onTap: () {
                BottomSheetOK(context);
              },
              child: Container(
                width: 211,
                height: 43,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff3F48CC)),
                child: Center(
                    child: Text(
                  "Send Request",
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
}
