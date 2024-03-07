import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:flutter/services.dart';
class ReferralCode extends StatefulWidget {
  const ReferralCode({super.key});

  @override
  State<ReferralCode> createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  final code = "8x10S";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: Text("Referral code",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: black
          ),),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height*0.35,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/referral banner.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          //referral banner
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Referral reward earned L7919",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              //referral rewards
              Icon(Icons.check_circle_rounded,color: darkgreen,)
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: Get.height*0.06,
              width: Get.width*0.8,
              child: Text("The friend who invited you will be able to see your referral status.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              // the friend who invited
            ),
            //the friend who
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: Get.height*0.06,
              width: Get.width*0.8,
              child: Text("You can earn more rewards by sharing your unique code.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              //you can earn more
            ),
            //you can earn more
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: Get.height*0.06,
              width: Get.width*0.8,
              child: Text("Share your code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            //share your code
          ),
          SizedBox(height: 20,),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10,right: 10),
          //   child: DottedBorder(
          //     borderType: BorderType.RRect,
          //     dashPattern: [6,3],
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 15,right: 8),
          //       child: TextFormField(
          //         decoration: InputDecoration(
          //           hintText: "8x10S",
          //           hintStyle: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //             color: black,
          //           ),
          //           suffixIcon: Icon(Icons.copy_rounded, color: black),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [6,3],

              child: InkWell(
                onTap: (){
                  Clipboard.setData(ClipboardData(text: code));
                 var snackbar = SnackBar(content: Text("Copied to clipboard"),);
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: Container(
                  height: Get.height*0.06,
                  width: Get.width*0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(code,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                        Icon(
                          Icons.copy_rounded,
                          size: 30,
                          color: black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //8x10s
            ),
          ),
          // ElevatedButton(
          //     style: ButtonStyle(
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(18.0),
          //         ),
          //       ),
          //       backgroundColor: MaterialStateProperty.all(Colors.indigo),
          //     ),
          //     onPressed: () {
          //       print("Check 222");
          //
          //       // Navigator.push(context,
          //       //   MaterialPageRoute(builder: (context) => const OtpScreen()),);
          //     },
          //     child: Text("Invite friends",
          //         style: TextStyle(
          //           fontSize: appStyle().fontSize20,
          //           fontWeight: FontWeight.bold,
          //           color: white,
          //         ))),
          SizedBox(height: 50,),
          Container(
            height: Get.height*0.05,
            width: Get.width*0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: darkblue,
            ),
            child: Center(
              child: Text("Invite friends",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: white,
              ),),
            ),
          )
          //invite friends
        ],
      ),
    );
  }
}
