import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/user/femaleperson_widget.dart';

class femaleperson extends StatelessWidget {
  const femaleperson({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('teacher').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
                        child: Text(
                          "no data found",
                          style: TextStyle(color: Colors.black),
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
