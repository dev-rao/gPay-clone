import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/GetHelp.dart';
import 'package:gpayclone/Screens/Profile.dart';
import 'package:gpayclone/Screens/TopQuestions.dart';
import 'package:video_player/video_player.dart';

class GetHelp extends StatefulWidget {
  const GetHelp({super.key});

  @override
  State<GetHelp> createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {
  final scrollController = ScrollController();
  bool showText = false;

  final videoPlayerController = VideoPlayerController.asset(
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
      //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      'assets/SampleVideo_360x240_20mb.mp4'
      // "https://youtu.be/Q4wLD3tIT4E"
      );
  var chewieController;

  initState() {
    print("hjgkjhgjhg,jhg");

    initVideo();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          print("Scrolling.....");
          showText = true;
        });
      } else {
        setState(() {
          print("Scrolling.....Back");
          showText = false;
        });
      }
    });

    super.initState();
  }

  initVideo() async {
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    setState(() {
      final playerWidget = Chewie(
        controller: chewieController,
      );
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          iconTheme: IconThemeData(color: black),
          title: Text(showText == false ? "" : "Google Pay Help",
              style: textStyle4),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text(
                          "Send feedback",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                onSelected: (item) => SelectedItem(context, item)),
          ]),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.2,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/gpayBanner.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 55,
                      width: 120,
                      child: Text(
                        "Google Pay Help",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ), //gpay help
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 70,
                      width: 155,
                      child: Text(
                        "Get help with payments, rewards, and more",
                        style: textStyle6
                      ),
                    ), //text
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: Get.height * 0.05,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: darkblue,
              ),
              child: Center(
                child: Text(
                  "Having issues?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            ), //having issue
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Top questions",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TopQuestions()),
                    );
                  },
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: darkblue,
                        ),
                      ),
                      //share
                    ),
                  ),
                )
              ],
            ), //top ques or view all
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 230,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            Container(
                              height: 180,
                              width: 230,
                              child: chewieController == null
                                  ? CircularProgressIndicator()
                                  : Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Chewie(
                                          controller: chewieController,
                                        ),
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                  // color: Colors.blue.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(
                                      20),), // color of grid items
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Stuck payments",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ), //list view
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 25,
                      color: darkblue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Pay bills using Google Pay",
                      style: textStyle6
                    )
                  ],
                ),
              ),
            ), //icon or text
            SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 25,
                      color: darkblue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Fix problems with transaction",
                      style: textStyle6
                    )
                  ],
                ),
              ),
            ), //icon or text
            SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 25,
                      color: darkblue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Add or remove payment methods",
                      style: textStyle6
                    )
                  ],
                ),
              ),
            ), //icon or text
            SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 25,
                      color: darkblue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Google Pay India Grievances",
                      style: textStyle6
                    )
                  ],
                ),
              ),
            ), //icon or text
            SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      size: 25,
                      color: darkblue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Fix problems with rewards",
                      style: textStyle6
                    )
                  ],
                ),
              ),
            ), //icon or text
            SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Icon(
                        Icons.list_alt,
                        size: 25,
                        color: darkblue,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.7,
                      child: Text(
                        "Protection against Fraud or Unauthorised activity",
                        style: textStyle6
                      ),
                    )
                  ],
                ),
              ),
            ), //icon or text
            SizedBox(
              height: 10,
            ),
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/invite51Rs.png"),
                  fit: BoxFit.fill,
                ),
              ),
              //asset image
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Container(
                      child: Text(
                        "Need more help?",
                        style: textStyle6
                      ),
                    ),
                  ), //invite 51
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Container(
                      child: Text(
                        "Talk to our specialist team",
                        style: textStyle6
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 40),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                        ),
                        onPressed: () {
                          print("Check 222");

                          // Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => const OtpScreen()),);
                        },
                        child: Text("Contact support",
                            style: TextStyle(
                              fontSize: appStyle().fontSize20,
                              fontWeight: FontWeight.bold,
                              color: darkblue,
                            ))),
                  ), //elevated invite
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SelectedItem(BuildContext context, item) {
    return
    showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25))),
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {

                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (ctx) =>
                                  AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            20)),
                                    backgroundColor:
                                    Colors.white,
                                    title: const Text(
                                      "Discard your feedback?",
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight:
                                        FontWeight.bold,
                                      ),
                                    ),
                                    content: const Text(
                                        "We would really like to hear from you, "
                                            "are you sure you don't want to send this?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
                                        child: Container(
                                          // color: Colors.green,
                                          // padding: const EdgeInsets.all(14),
                                          child: const Text(
                                              "Continue writing",
                                              style: TextStyle(
                                                  fontSize:
                                                  18,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color: Colors
                                                      .indigo)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Navigator.pop(context);
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          // color: Colors.purple,
                                          // padding: const EdgeInsets.all(14),
                                          child: const Text(
                                            "Discard",
                                            style: TextStyle(
                                                fontSize:
                                                18,
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                color: Colors
                                                    .indigo),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            );

                          },
                          child: Icon(
                              Icons.close_rounded)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                          "Send feedback to Google",
                          style: textStyle4
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      color:
                      Colors.pink.withOpacity(0.1),
                      borderRadius:
                      BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10),
                        child: Text(
                            "Welcome!",
                            style: textStyle6
                        ),
                      ),
                      Icon(
                        Icons.waving_hand,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height * 0.15,
                    width: Get.width * 0.4,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mode_comment_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "Answer a few questions",
                            textAlign: TextAlign.center,
                            style: textStyle6
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 40),
                    child: Container(
                      height: 3,
                      width: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: Get.height * 0.15,
                    width: Get.width * 0.35,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send,
                          size: 30,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Share your feedback",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 10),
                child: Container(
                  width: Get.width * 0.9,
                  child: Text(
                    "Some account & system information may be sent to Google, subject to our Privacy Policy & Terms of Service. Go to Legal Help for content changes.",
                    style: textStyle5,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(Icons.shield_moon_outlined),
                    Text(
                      "Manage your Account & system information",
                      style: textStyle5,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 10),
                child: Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    color: indigo,
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
