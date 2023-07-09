import 'package:chewie/chewie.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class teacherfavoritedetail extends StatefulWidget {
  String firstName;
  String LastName;
  String imageurl;
  String language;
  String teacherid;
  String address;
  String fph;
  String about;
  String category;

  String videoUrl;
  // String username;
  // String userimageurl;
  // String useraddress;
  String userid;

  teacherfavoritedetail({
    super.key,
    required this.firstName,
    required this.LastName,
    required this.imageurl,
    required this.language,
    required this.teacherid,
    required this.address,
    required this.fph,
    required this.about,
    required this.category,

    // required this.username,
    // required this.userimageurl,
    // required this.useraddress,
    required this.userid,
    required this.videoUrl,
  });

  @override
  State<teacherfavoritedetail> createState() => _teacherfavoritedetailState();
}

class _teacherfavoritedetailState extends State<teacherfavoritedetail> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  late Future<void> _initializeVideoPlayerFuture;
  List<String> videourl1 = [];

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
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
          "Favorite Teacher",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Segoe UI",
            color: Color(0xff000000),
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 12),
          //   child: GestureDetector(
          //     onTap: () {
          //       FirebaseFirestore.instance
          //           .collection('favoriteteacher')
          //           .doc(widget.teacherid)
          //           .set({
          //             'firstName': widget.firstName,
          //             'LastName': widget.LastName,
          //             'imageurl': widget.imageurl,
          //             'about': widget.about,
          //             'address': widget.address,
          //             'language': widget.language,
          //             'category': widget.category,
          //             'fph': widget.fph,
          //             'teacherid': widget.teacherid,
          //             'userid': widget.userid,
          //             'videoUrl': widget.videoUrl,
          //             'status': 'favoriteteache',
          //             // 'requestdate': DateTime.now(),
          //           })
          //           .then((value) => {
          //                 displayMessage(
          //                     ' Your  Favorite Teacher is Selectd ok'),
          //                 Navigator.pop(context),
          //               })
          //           .onError((error, stackTrace) => {
          //                 displayMessage(error.toString()),
          //               });
          //     },
          //     child: Image.asset(
          //       "assets/fv.png",
          //       width: 30,
          //       height: 30,
          //     ),
          //   ),
          // ),
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _controller.initialize(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
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
                        color: Color(0xff008022).withOpacity(0.15),
                      ),
                      child: Center(
                        child: Text(
                          "Favorite",
                          style: TextStyle(
                            color: Color(0xff008022),
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
                      widget.fph + "hr",
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
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 36,
            //   padding: EdgeInsets.only(left: 10, top: 9),
            //   color: Color(0xffC4C4C4).withOpacity(0.30),
            //   child: Text(
            //     "Payment Proof",
            //     style: TextStyle(
            //       color: Color(0xff000000),
            //       fontWeight: FontWeight.w600,
            //       decoration: TextDecoration.none,
            //       fontSize: 16,
            //       fontFamily: 'Segoe UI',
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 31,
            ),
            // Container(
            //   width: 260,
            //   height: 160,
            //   child: widget.paymentproof == ''
            //       ? Image.asset("assets/propic.png")
            //       : Container(
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: NetworkImage(widget.paymentproof),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            // ),
            // SizedBox(
            //   height: 39,
            // ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
            //     child: Text(
            //       'Mobile Number',
            //       style: TextStyle(
            //         color: Color(0xff000000),
            //         fontWeight: FontWeight.bold,
            //         decoration: TextDecoration.none,
            //         fontSize: 16,
            //         fontFamily: 'Archivo',
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Clipboard.setData(ClipboardData(text: "0314657687366631"));
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Copied to clipboard')),
            //     );
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: Container(
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: Color(0xffC4C4C4).withOpacity(0.20),
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(color: Color(0xffC7C7C7)),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 12, right: 12),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text("+1 833-431-0620"),
            //             Row(
            //               children: [
            //                 Image.asset(
            //                   "assets/copy.png",
            //                   width: 16,
            //                   height: 19,
            //                 ),
            //                 SizedBox(width: 10),
            //                 Text(
            //                   "Copy",
            //                   style: TextStyle(
            //                     color: Color(0xff3081CA),
            //                     fontWeight: FontWeight.w500,
            //                     decoration: TextDecoration.none,
            //                     fontSize: 15,
            //                     fontFamily: 'Archivo',
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
