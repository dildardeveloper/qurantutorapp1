import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/user/userditprofile.dart';
import 'package:qurantutorapp/user/usersetting.dart';

class userprof extends StatelessWidget {
  const userprof({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where("userid",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final teacherDocs = snapshot.data!.docs;
                // You can now use the teacherDocs list to access the data
                // and display it in your UI
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: teacherDocs.length,
                    itemBuilder: (context, index) {
                      final teacherData =
                          teacherDocs[index].data() as Map<String, dynamic>;
                      final firstName = teacherData['firstName'];
                      final LastName = teacherData['LastName'];
                      final imageurl = teacherData['imageurl'];
                      final email = teacherData['email'];
                      final password = teacherData['password'];
                      final confirmpassword = teacherData['confirmpassword'];
                      final country = teacherData['country'];
                      final city = teacherData['city'];
                      final address = teacherData['address'];
                      final gender = teacherData['gender'];

                      final language = teacherData['language'];
                      final about = teacherData['about'];

                      return Column(
                        children: [
                          // subtitle: Text(teacherData['email']),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.amber,
                            child: Stack(
                              children: [
                                Image.asset("assets/Ellipse.png"),
                                Positioned(
                                    top: 30,
                                    left: 167,
                                    right: 0,
                                    bottom: 0,
                                    child: Text(
                                      "Profile",
                                      style: appbarcentertextstyle,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.15)
                                  // border: Border.all(
                                  //   color: Colors.grey,
                                  //   width: 1,
                                  // ),
                                  ),
                              child: imageurl != null
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(imageurl),
                                      radius: 20, // adjust this value as needed
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/dp.jpg"),
                                      radius: 20, // adjust this value as needed
                                    )),
                          firstName == ''
                              ? Text(
                                  "Ahmad Duggan",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                  ),
                                )
                              : Text(
                                  firstName,
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                  ),
                                ),

                          SizedBox(
                            height: 5,
                          ),
                          email == ''
                              ? Text(
                                  "abc123@gmail.com",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              : Text(
                                  email,
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    fontFamily: 'Poppins',
                                  ),
                                ),

                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            minLeadingWidth: 0,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => userditprofile(
                                        firstName: firstName,
                                        LastName: LastName,
                                        imageurl: imageurl,
                                        email: email,
                                        password: password,
                                        confirmpassword: confirmpassword,
                                        country: country,
                                        city: city,
                                        address: address,
                                        gender: gender,
                                        dob: teacherData['dob'],
                                        about: about,
                                        language: language
                                        //teacherid: widget.teacherid,
                                        )),
                              );
                            },
                            leading: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey.withOpacity(0.20),
                              ),
                              child: Image.asset("assets/editpro.png"),
                            ),
                            title: Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                          ListTile(
                            minLeadingWidth: 0,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => usersetting()),
                              );
                            },
                            leading: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey.withOpacity(0.20),
                              ),
                              child: Icon(
                                Icons.settings,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              "Setting",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),

                          ListTile(
                            minLeadingWidth: 0,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                          child:
                                              Image.asset("assets/cross.png")),
                                    ),
                                  ),
                                  content: Container(
                                    height: 280,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.grey.withOpacity(0.40),
                                          ),
                                          child: Image.asset(
                                            'assets/logout.png',
                                            height: 80,
                                            width: 90,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Text(
                                          'Are you sure you want to logout?',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                        SizedBox(height: 30),
                                        Container(
                                          width: 184,
                                          height: 41,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Perform logout action here
                                            },
                                            child: Text(
                                              'Logout now',
                                              style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.none,
                                                fontSize: 17,
                                                fontFamily: 'Aref Ruqaa',
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                minimumSize: Size(220, 40),
                                                backgroundColor: Color(
                                                    0xff3F48CC) // set minimum height and width
                                                ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            leading: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffC4C4C4).withOpacity(0.5),
                              ),
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error loading teacher data.');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
