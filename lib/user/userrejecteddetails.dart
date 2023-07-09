import 'package:chewie/chewie.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class userrejecteddetails extends StatefulWidget {
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
  String videoUrl;
  // String username;
  // String userimageurl;
  // String useraddress;
  userrejecteddetails({
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
    required this.request,
    required this.requestid,
    required this.addserviceid,
    // required this.username,
    // required this.userimageurl,
    // required this.useraddress,
    // required this.userid,
    required this.videoUrl,
  });

  @override
  State<userrejecteddetails> createState() => _userrejecteddetailsState();
}

class _userrejecteddetailsState extends State<userrejecteddetails> {
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
          "Request Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: Color(0xff000000),
          ),
        ),
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

            // FutureBuilder(
            //   future: _controller.initialize(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       return Container(
            //         color: Colors.black,
            //         width: MediaQuery.of(context).size.width,
            //         height: MediaQuery.of(context).size.height * 0.35,
            //         child: Chewie(
            //           controller: _chewieController,
            //         ),
            //       );
            //     } else {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
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
                        color: Color(0xffFF0000).withOpacity(0.15),
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
          ],
        ),
      ),
    );
  }
}
