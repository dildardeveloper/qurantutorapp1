import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/teacher/teacherprof.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class serviceedit extends StatefulWidget {
  final videoUrl;
  final videoUrl1;
  final category;
  final dsc;
  final fph;
  final wn;

  const serviceedit({
    super.key,
    required this.videoUrl,
    required this.videoUrl1,
    required this.category,
    required this.dsc,
    required this.fph,
    required this.wn,
  });

  @override
  State<serviceedit> createState() => _serviceeditState();
}

class _serviceeditState extends State<serviceedit> {
  late TextEditingController descController;
  late TextEditingController whatsapno;
  late TextEditingController categoryname;
  late TextEditingController feeperhor;

  late VideoPlayerController _controllerv1;
  late VideoPlayerController _controllerv2;
  late Future<void> _initializeVideoPlayerFuture;

  String? _selectedValue;
  final servicesid = Uuid().v1();
  @override
  void initState() {
    descController = TextEditingController(text: widget.dsc);
    whatsapno = TextEditingController(text: widget.wn);
    categoryname = TextEditingController(text: widget.category);
    feeperhor = TextEditingController(text: widget.fph);
    _controllerv1 = VideoPlayerController.network(widget.videoUrl1);
    _initializeVideoPlayerFuture = _controllerv1.initialize();

    _controllerv2 = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controllerv2.initialize();
    _controllerv2.play();
    super.initState();
    _getOptions();
  }

  Stream<QuerySnapshot> _getOptions() {
    return FirebaseFirestore.instance.collection('category').snapshots();
  }

  Uuid uuid = Uuid();

  final picker = ImagePicker();

  var secondDownloadUrl;
  var firstDownloadUrl;

  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;

  File? _videoFile1;
  bool _isVideoPicked1 = false;
  File? _videoFile2;
  bool _isVideoPicked2 = false;

  Future<void> _pickVideo1() async {
    // ignore: deprecated_member_use
    final file = await ImagePicker().getVideo(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _videoFile1 = File(file.path);
        _controller = VideoPlayerController.file(_videoFile1!);
        _controller.initialize();
        _controller.setLooping(true);
        // _controller.play();
        _isVideoPicked1 = true;
      });
    }
  }

  Future<void> _pickVideo2() async {
    // ignore: deprecated_member_use
    final file = await ImagePicker().getVideo(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _videoFile2 = File(file.path);
        _controller1 = VideoPlayerController.file(_videoFile2!);
        _controller1.initialize();
        _controller1.setLooping(true);

        _isVideoPicked2 = true;
      });
    }
  }

  Future<void> _uploadVideos() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Center(
          child: CircularProgressIndicator(color: Colors.green),
        ),
      );

      if (_videoFile1 != null) {
        final firstVideoRef = FirebaseStorage.instance
            .ref()
            .child('teacher')
            .child(uuid.v4().toString());
        final firstSnapshot = await firstVideoRef.putFile(_videoFile1!);
        firstDownloadUrl = await firstSnapshot.ref.getDownloadURL();
        print('Uploaded the first video and saved the URL to Firestore!');
      }

      if (_videoFile2 != null) {
        final secondVideoRef = FirebaseStorage.instance
            .ref()
            .child('teacher')
            .child(uuid.v4().toString());
        final secondSnapshot = await secondVideoRef.putFile(_videoFile2!);
        secondDownloadUrl = await secondSnapshot.ref.getDownloadURL();
        print('Uploaded the second video and saved the URL to Firestore!');
      }

      final dataToUpdate = {
        'dsc': descController.text,
        'fph': feeperhor.text,
        'wn': whatsapno.text,
        'category': _selectedValue,
        'addserviceid': servicesid,
        'teacherid': FirebaseAuth.instance.currentUser!.uid,
        'status': 'pending',
      };

      if (firstDownloadUrl != null) {
        dataToUpdate['videoUrl'] = firstDownloadUrl;
      }

      if (secondDownloadUrl != null) {
        dataToUpdate['videoUrl1'] = secondDownloadUrl;
      }

      await FirebaseFirestore.instance
          .collection('addservice')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(dataToUpdate)
          .then((value) {
        displayMessage("update");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => teacherprof()),
        );
      }).onError((error, stackTrace) {
        displayMessage(error.toString());
      });
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
      displayMessage(e.toString());
    }
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
          elevation: 2,
          title: Text(
            "Add service Details",
            style: appbarcentertextstyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Add Presentation Video  ',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(2 minutes)',
                          style: TextStyle(
                            color: Color(0xff7B7B7B),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 260,
                          height: 120,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 8,
                                  color: Colors.grey.withOpacity(0.15),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffF5F5F5)),
                        ),
                        _isVideoPicked1
                            ? Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  width: 240,
                                  height: 90,
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [10, 10],
                                      color: Colors.black,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          width: 250,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _pickVideo1();
                                                  print("object1");
                                                },
                                                child: AspectRatio(
                                                  aspectRatio: 85 / 30,
                                                  child: VideoPlayer(
                                                    _controller,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  width: 240,
                                  height: 90,
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [10, 10],
                                      color: Colors.black,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _pickVideo1();
                                                },
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 85 / 30,
                                                    child: VideoPlayer(
                                                      _controllerv1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              // Text("Upload video")
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Add Lessons Video  ',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(2 minutes)',
                          style: TextStyle(
                            color: Color(0xff7B7B7B),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 260,
                          height: 120,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 8,
                                  color: Colors.grey.withOpacity(0.15),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffF5F5F5)),
                        ),
                        _isVideoPicked2
                            ? Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  width: 240,
                                  height: 90,
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [10, 10],
                                      color: Colors.black,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          width: 250,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _pickVideo2();
                                                  print("object1");
                                                },
                                                child: AspectRatio(
                                                  aspectRatio: 85 / 30,
                                                  child: VideoPlayer(
                                                    _controller1,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  width: 240,
                                  height: 90,
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [10, 10],
                                      color: Colors.black,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _pickVideo2();
                                                },
                                                child: Center(
                                                  child: AspectRatio(
                                                    aspectRatio: 85 / 30,
                                                    child: VideoPlayer(
                                                      _controllerv2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              // Text("Upload video")
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Add Service About  ',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,

                  child: TextFormField(
                    controller: categoryname,
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18, right: 10),
                        hintStyle: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        label: Text(
                          "Select Category",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: StreamBuilder<QuerySnapshot>(
                          stream: _getOptions(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            List options = snapshot.data!.docs
                                .map((doc) => doc['categoryname'])
                                .toList();
                            // var id = snapshot.data!.docs
                            //     .map((doc) => doc['categoryname']);

                            return DropdownButton<String>(
                              underline: SizedBox(),
                              value: _selectedValue,
                              items: options
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 10),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) async {
                                setState(() {
                                  _selectedValue = newValue;
                                });
                                // Replace 'students' with the name of the collection you want to update in Firestore
                                // await FirebaseFirestore.instance
                                //     .collection('addservice')
                                //     .doc('student1')
                                //     .update({'teacher': newValue});
                              },
                              hint: Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, right: 18),
                                child: Text('Select a Category'),
                              ),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              isExpanded: true,
                            );
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Gender";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(
                    controller: descController,
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18, right: 10),
                        hintStyle: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        // fillColor: Colors.white,
                        // filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter description",
                        label: Text(
                          "Description",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Gender";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(
                    controller: feeperhor,
                    // added maxLength property
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18, right: 10),
                        hintStyle: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        // fillColor: Colors.white,
                        // filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "0",
                        label: Text(
                          "Fee per hour",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Gender";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(
                    // controller: wn..text = widget.wn,
                    controller: whatsapno,
                    // added maxLength property
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18, right: 10),
                        hintStyle: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        // fillColor: Colors.white,
                        // filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter number",
                        label: Text(
                          "Whatsapp Number",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Gender";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  // height: 60,
                ),
                InkWell(
                  onTap: () {
                    // Timer(
                    //     Duration(seconds: 3),
                    //     () => Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => teacherprof(
                    //                   teacherid: widget.teacherid,
                    //                   servicesid: servicesid)),
                    //         ));
                    _uploadVideos();
                    print("object up");

                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       content: Container(
                    //         width: 290,
                    //         height: 270,
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               "assets/alert.png",
                    //             ),
                    //             SizedBox(
                    //               height: 50,
                    //             ),
                    //             Text(
                    //               "Published",
                    //               style: TextStyle(
                    //                 color: Color(0xff3F48CC),
                    //                 fontWeight: FontWeight.bold,
                    //                 decoration: TextDecoration.none,
                    //                 fontSize: 18,
                    //                 fontFamily: 'Aref Ruqaa',
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: appcolor),
                    child: Center(
                      child: Text(
                        "Publish",
                        style: buttiontextstyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
