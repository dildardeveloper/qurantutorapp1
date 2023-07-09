import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/user/teacherfavoritedetail.dart';

class userfavorite extends StatelessWidget {
  const userfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 1,
        title: Text(
          "Favorite",
          style: appbarcentertextstyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('favoriteteacher')
                  .where("userid",
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where("status", isEqualTo: "favoriteteache")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final firstName =
                            snapshot.data!.docs[index]['firstName'];
                        final LastName = snapshot.data!.docs[index]['LastName'];
                        final imageurl = snapshot.data!.docs[index]['imageurl'];

                        final language = snapshot.data!.docs[index]['language'];

                        final teacherid =
                            snapshot.data!.docs[index]['teacherid'];
                        final address = snapshot.data!.docs[index]['address'];
                        final fph = snapshot.data!.docs[index]['fph'];

                        final videoUrl = snapshot.data!.docs[index]['videoUrl'];

                        final about = snapshot.data!.docs[index]['about'];
                        final category = snapshot.data!.docs[index]['category'];
                        final userid = snapshot.data!.docs[index]['userid'];

                        // DateTime timestamp = (snapshot.data!.docs[index]
                        //         ['requestdate'] as Timestamp)
                        //     .toDate();

                        // // Format DateTime as desired
                        // String formattedTime =
                        //     DateFormat('dd MMM, hh:mm a').format(timestamp);
                        // final requestdate = formattedTime;
                        return Container(
                          width: 345,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
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
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            teacherfavoritedetail(
                                              firstName: firstName,
                                              LastName: LastName,
                                              imageurl: imageurl,
                                              about: about,
                                              address: address,
                                              language: language,
                                              category: category,
                                              fph: fph,
                                              teacherid: teacherid,
                                              userid: userid,
                                              videoUrl: videoUrl,
                                            )),
                                  );
                                },
                                horizontalTitleGap: 5,
                                minVerticalPadding: 18,
                                contentPadding: EdgeInsets.zero,
                                leading: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 0),
                                    child: imageurl == ''
                                        ? CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                AssetImage("assets/female.png"),
                                          )
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                NetworkImage(imageurl),
                                          )),
                                title: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        firstName,
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
                                      SizedBox(
                                        height: 3,
                                      ),
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
                                            address,
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
                                    ],
                                  ),
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Image.asset(
                                        "assets/fv.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Text(
                                        fph + "hr",
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: Text('Data not found'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
