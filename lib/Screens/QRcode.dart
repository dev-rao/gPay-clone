import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/GetHelp.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class QRcode extends StatefulWidget {
  const QRcode({Key? key});

  @override
  State<QRcode> createState() => _QRcodeState();
}

class _QRcodeState extends State<QRcode> {
  final ImagePicker picker = ImagePicker();
  File? image1;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String scannedCode = '';

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  function(parameters){
    //Block

    // Statements...;
  }

  void _onQRViewCreated(QRViewController controller) {
    print(" <-- QRViewCreated --> ");
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedCode = scanData.code!;
        print("scannedCode --> " + scannedCode.toString());
        if (scannedCode != "") {
          print("<< scannedCode Not Empty >>");
          if(scannedCode.contains("http")){
            print("<< URL >>");
            launch(scannedCode);
          }
          else{
            print("<< Not a URL >>");
            Fluttertoast.showToast(msg: "Not a url");
          }

          Navigator.pop(context);
          // Get.back();
        }
        else{
          print("<< scannedCode Empty >>");
        }
      });
    });
  }

  bool flash = false;

  pickfile() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        print("image --> " + image.path.toString());
      } else {
        print("Image Not Selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text("Scan any QR"),
      // ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              child: Stack(children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                      cutOutBottomOffset: 100,
                      borderRadius: 20,
                      cutOutSize: size.width * 0.8,
                      borderLength: 35,
                      borderColor: red,
                      borderWidth: 15),
                ),
              ]),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close,
                            color: white,
                            size: 30,),
                        ),
                        SizedBox(
                          width: 210,
                        ),
                        InkWell(
                            onTap: () async {
                              await controller?.toggleFlash();
                              // bool? flashstat= await controller?.getFlashStatus();
                              // print("fekokeof"+flashstat.toString());
                              setState(() {
                                flash = !flash;
                              });
                            },
                            child: flash == false
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.flashlight_on_outlined,
                                      color: white,
                                      size: 30,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: white),
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.flashlight_on_outlined,
                                      color: black,
                                      size: 30,
                                    ),
                                  )),
                        SizedBox(width: 20,),
                        Icon(Icons.qr_code_2,
                          color: white,
                          size: 30,),

                          PopupMenuButton(
                            color: Colors.black,
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    "Send QR feedback",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(
                                    "Get help",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                              onSelected: (item) => SelectedItem(context, item),
                            icon: Icon(Icons.more_vert, color: Colors.white,),),
                      ],
                    ),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 200,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height*0.05,
                        width: Get.width*0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(Icons.photo_outlined),
                              SizedBox(width: 10,),
                              Text("Upload from gallery",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),),
                            ],
                          ),
                        ),
                      ),
                      Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse('$scannedCode'),
                          builder: (context, followLink) => TextButton(
                              onPressed: followLink,
                              child: Text(
                                '$scannedCode',
                                style: TextStyle(fontSize: 18),
                              ))),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
  SelectedItem(BuildContext context, item,) {
    switch (item) {
      case 0:
        showModalBottomSheet(
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
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GetHelp()),
        );
        break;
    }

  }

}
