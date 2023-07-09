import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qurantutorapp/user/userrejecteddetails.dart';

class userrejected extends StatelessWidget {
  const userrejected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('request')
                  .where("request", isEqualTo: "reject")
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
                        // final LastName = snapshot.data!.docs[index]['LastName'];
                        final imageurl = snapshot.data!.docs[index]['imageurl'];

                        // final language = snapshot.data!.docs[index]['language'];

                        //final teacherid =
                        snapshot.data!.docs[index]['teacherid'];
                        final address = snapshot.data!.docs[index]['address'];
                        final fph = snapshot.data!.docs[index]['fph'];

                        // final username = snapshot.data!.docs[index]['username'];
                        //  final userimageurl =
                        // snapshot.data!.docs[index]['userimageurl'];
                        //  final useraddress =
                        // snapshot.data!.docs[index]['useraddress'];

                        // final about = snapshot.data!.docs[index]['about'];
                        final category = snapshot.data!.docs[index]['category'];
                        // final userid = snapshot.data!.docs[index]['userid'];

                        DateTime timestamp = (snapshot.data!.docs[index]
                                ['requestdate'] as Timestamp)
                            .toDate();

                        // Format DateTime as desired
                        String formattedTime =
                            DateFormat('dd MMM, hh:mm a').format(timestamp);
                        final requestdate = formattedTime;
                        return Container(
                          width: 345,
                          height: 130,
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
                                            userrejecteddetails(
                                              firstName: snapshot.data!
                                                  .docs[index]['firstName'],
                                              LastName: snapshot.data!
                                                  .docs[index]['LastName'],
                                              imageurl: snapshot.data!
                                                  .docs[index]['imageurl'],
                                              language: snapshot.data!
                                                  .docs[index]['language'],
                                              teacherid: snapshot.data!
                                                  .docs[index]['teacherid'],
                                              address: snapshot
                                                  .data!.docs[index]['address'],
                                              fph: snapshot.data!.docs[index]
                                                  ['fph'],
                                              about: snapshot.data!.docs[index]
                                                  ['about'],
                                              category: snapshot.data!
                                                  .docs[index]['category'],
                                              requestid: snapshot.data!
                                                  .docs[index]['requestid'],
                                              request: snapshot
                                                  .data!.docs[index]['request'],
                                              addserviceid: snapshot.data!
                                                  .docs[index]['addserviceid'],
                                              // username: snapshot.data!
                                              //     .docs[index]['username'],
                                              // userimageurl: snapshot.data!
                                              //     .docs[index]['userimageurl'],
                                              // useraddress: snapshot.data!
                                              //     .docs[index]['useraddress'],
                                              // userid: snapshot.data!.docs[index]
                                              //     ['userid'],
                                              videoUrl: snapshot.data!
                                                  .docs[index]['videoUrl'],
                                              // paymentproof: snapshot.data!
                                              //     .docs[index]['paymentproof'],
                                            )),
                                  );
                                },
                                horizontalTitleGap: 5,
                                minVerticalPadding: 18,
                                contentPadding: EdgeInsets.zero,
                                leading: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(imageurl),
                                  ),
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                trailing: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 11, top: 20),
                                  child: Text(
                                    fph + 'hr',
                                    style: TextStyle(
                                      color: Color(0xff3F48CC),
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      fontSize: 13,
                                      fontFamily: 'Aref Ruqaa',
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Color(0xffE4E4E4),
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, right: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      requestdate,
                                      style: TextStyle(
                                        color: Color(0xff3F48CC),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontFamily: 'Segoe UI',
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color:
                                            Color(0xffFF0000).withOpacity(0.15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "REJECTED",
                                          style: TextStyle(
                                            color: Color(0xffFF0101),
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.none,
                                            fontSize: 12,
                                            fontFamily: 'Segoe UI',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
