import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/user/maleperson_widget.dart';

class maleperson extends StatefulWidget {
  const maleperson({super.key});

  @override
  State<maleperson> createState() => _malepersonState();
}

class _malepersonState extends State<maleperson> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: (search != "" && search != '')
            ? FirebaseFirestore.instance
                .collection('teacher')
                .where("firstName", isGreaterThanOrEqualTo: search)
                .snapshots()
            : FirebaseFirestore.instance.collection('teacher').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final firstName = snapshot.data!.docs[index]['firstName'];
                  final LastName = snapshot.data!.docs[index]['LastName'];
                  final imageurl = snapshot.data!.docs[index]['imageurl'];

                  final language = snapshot.data!.docs[index]['language'];

                  final teacherid = snapshot.data!.docs[index]['teacherid'];
                  final address = snapshot.data!.docs[index]['address'];
                  final gender = snapshot.data!.docs[index]['gender'];
                  final about = snapshot.data!.docs[index]['about'];

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
                        height: 400,
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
        });
  }
}
