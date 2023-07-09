import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:qurantutorapp/main.dart';
import 'package:qurantutorapp/user/allowlocation.dart';
import 'package:qurantutorapp/user/bottomnavbar.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class createprofile extends StatefulWidget {
  String userid;
  var latitude;
  var longitude;

  createprofile(
      {super.key, required this.userid, this.latitude, this.longitude});

  @override
  State<createprofile> createState() => _createprofileState();
}

class _createprofileState extends State<createprofile> {
  final TextEditingController phone = TextEditingController();
  //final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController lang = TextEditingController();

  final _genderOptions = ['Male', 'Female', 'Other'];
  String? _selectedGender;
  DateTime? _selectedDateOfBirth;
  Uuid uuid = Uuid();
  File? _image;
  void convertCoordinatesToAddress() async {
    double latitude = widget.latitude;
    double longitude = widget.longitude;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String formattedAddress =
          '${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea},${placemark.country}';

      // Update the text field with the address
      address.text = formattedAddress;
    }
  }

  @override
  void initState() {
    print(widget.userid);

    super.initState();
    convertCoordinatesToAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF5F5F5),
        toolbarHeight: 30,
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Let’s complete profile',
                  style: toptextstyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: _image == null
                            ? AssetImage("assets/dp.jpg") as ImageProvider
                            : FileImage(_image!),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 60,
                      right: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: appcolor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () async {
                            final picker = ImagePicker();
                            await picker
                                // ignore: deprecated_member_use
                                .getImage(source: ImageSource.gallery)
                                .then((value) {
                              setState(() {
                                _image = File(value!.path);
                              });
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: phone,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    hintStyle: TextStyle(
                      color: Color(0xffAAAAAA),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "Phone (Optional)",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone (Optional)";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, right: 10),
                    hintStyle: TextStyle(
                      color: Color(0xffAAAAAA),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText:
                        _selectedGender == null ? "Gender" : _selectedGender,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: DropdownButton<String>(
                      value: _selectedGender,
                      items: _genderOptions
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      underline: SizedBox(),
                      elevation: 8,
                      isExpanded: false,
                      dropdownColor: Colors.white,
                      style: TextStyle(color: Colors.black),
                      selectedItemBuilder: (BuildContext context) {
                        return _genderOptions.map<Widget>((String value) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Text(''),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Gender";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 49,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 8,
                            color: Colors.grey.withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: lang,
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 12,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xffAAAAAA),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          hintText: 'Language',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          // suffixIcon: GestureDetector(
                          //   onTap: () => _selectDateOfBirth(context),
                          //   child: Icon(
                          //     Icons.keyboard_arrow_down_outlined,
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    Container(
                      height: 49,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 8,
                            color: Colors.grey.withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 12,
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xffAAAAAA),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          hintText: _selectedDateOfBirth == null
                              ? 'Date of Birth'
                              : _selectedDateOfBirth.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => _selectDateOfBirth(context),
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 49,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 8,
                            color: Colors.grey.withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: country,
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 18, right: 10),
                          hintStyle: TextStyle(
                            color: Color(0xffAAAAAA),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          hintText: "Country",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Country";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: 49,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 8,
                            color: Colors.grey.withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: city,
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          hintStyle: TextStyle(
                            color: Color(0xffAAAAAA),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          fillColor: Colors.white.withOpacity(0.20),
                          filled: true,
                          hintText: 'City',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          // suffixIcon: GestureDetector(
                          //   onTap: () => _selectDateOfBirth(context),
                          //   child: Icon(
                          //     Icons.keyboard_arrow_down_outlined,
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: address,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    suffixIcon: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => allowlocation()),
                          );
                        },
                        child: Image.asset('assets/addres.png')),
                    hintStyle: TextStyle(
                      color: Color(0xffAAAAAA),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: 'address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
                height: 47,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 8,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: about,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    hintStyle: TextStyle(
                      color: Color(0xffAAAAAA),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    hintText: "About",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "About";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                // height: 60,
              ),
              InkWell(
                onTap: () {
                  if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
                    // Check if widget.userid is not empty
                    print('object');
                    Reference reference = FirebaseStorage.instance
                        .ref()
                        .child('user')
                        .child(uuid.v4().toString());
                    UploadTask task = reference.putFile(_image!);
                    task.whenComplete(() {
                      reference.getDownloadURL().then((imgurl) {
                        var userimg = imgurl;
                        FirebaseFirestore.instance
                            .collection('user')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "gender": _selectedGender,
                          "imageurl": userimg,
                          'dob': _selectedDateOfBirth.toString().trim(),
                          'phone': phone.text,
                          'about': about.text,
                          'address': address.text,
                          'language': lang.text,
                        }).then((value) {
                          print("account");
                          displayMessage("create profile done");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => bottomnavbar()),
                          );
                        }).catchError((error) {
                          // Handle error during Firestore update
                          displayMessage("Error: $error");
                        });
                      });
                    });
                  } else {
                    displayMessage("Invalid user ID"); // Handle empty user ID
                  }
                },
                child: Container(
                  height: 47,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: appcolor),
                  child: Center(
                    child: Text(
                      "Finish",
                      style: buttiontextstyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDateOfBirth(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDateOfBirth = pickedDate;
      });

      // Get the current user's ID
      // final String userId = FirebaseAuth.instance.currentUser.uid;

      // // Add the selected date of birth to Firestore
      // usersCollection.doc(userId).set({'dateOfBirth': pickedDate});
    }
  }
}
