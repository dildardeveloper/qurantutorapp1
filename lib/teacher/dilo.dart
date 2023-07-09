import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';
import 'package:video_player/video_player.dart';
import 'package:expandable_text/expandable_text.dart';

class techservicedetail extends StatefulWidget {
  final firstName;
  final LastName;
  final imageurl;
  final address;
  final category;
  final dsc;
  final fph;
  final videoUrl1;
  final videoUrl;
  techservicedetail(
      {super.key,
      required this.firstName,
      required this.LastName,
      required this.imageurl,
      required this.address,
      required this.videoUrl,
      required this.videoUrl1,
      required this.category,
      required this.dsc,
      required this.fph});

  @override
  State<techservicedetail> createState() => _techservicedetailState();
}

class _techservicedetailState extends State<techservicedetail> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  late Future<void> _initializeVideoPlayerFuture;
  List<String> videourl1 = [];

  @override
  void initState() {
    super.initState();
    videourl1 = [widget.videoUrl, widget.videoUrl1];
    _controller = VideoPlayerController.network(widget.videoUrl1);
    _initializeVideoPlayerFuture = _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
          "My Service Detail",
          style: appbarcentertextstyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      FutureBuilder(
                        future: VideoPlayerController.network(widget.videoUrl)
                            .initialize(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Chewie(
                              controller: _chewieController,
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                      Positioned(
                        top: height * 0.02,
                        left: width * 0.045,
                        right: width * 0.045,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.white.withOpacity(0.2),
                              height: height * 0.035,
                              width: width * 0.085,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: height * 0.017,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Container(
                              height: height * 0.035,
                              width: width * 0.085,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: height * 0.017,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 2,
                pagination: SwiperPagination(),
                control: SwiperControl(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
                title: Text(
                  "Ahmad Duggan",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontFamily: 'Segoe UI',
                  ),
                ),
                subtitle: Text(
                  "Here show my about.Here show my about.Here show my about here... ",
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
                  backgroundImage: AssetImage("assets/dp.jpg"),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              padding: EdgeInsets.only(left: 10, top: 9),
              color: Color(0xffC4C4C4).withOpacity(0.30),
              child: Text(
                "User Information",
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
                      fontSize: 15,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Text(
                    "Street #123, city, Sudia Arabia",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
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
                      fontSize: 15,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Text(
                    "Arabic",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
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
                      fontSize: 15,
                      fontFamily: 'Segoe UI',
                    ),
                  ),
                  Text(
                    "Jihad, Hijrat",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
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
                  Text(
                    "24/hr",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontFamily: 'Segoe UI',
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
              height: 25,
            ),
            Container(
              width: 145,
              height: 41,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff3F48CC)),
              child: Center(
                  child: Text(
                "Edit",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Aref Ruqaa',
                ),
              )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
