
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/BankAccount.dart';
import 'package:gpayclone/Screens/GetHelp.dart';
import 'package:gpayclone/Screens/ReferralCode.dart';
import 'package:gpayclone/Screens/UpiLite.dart';
import 'package:gpayclone/Screens/UrlLaunch.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        "Referral code",
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
                    PopupMenuItem<int>(
                      value: 2,
                      child: Text(
                        "Send feedback",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
              onSelected: (item) => SelectedItem(context, item)),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: Get.height * 0.3,
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/gpayBanner.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      //profile banner
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "gajendra rao",
                              style: textStyle3,
                            ),
                            //gajendra
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "raogajendra",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // rao gajendra
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "9829714655",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //9829714655
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: unique,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.indigo,
                                        ),
                                        Text(
                                          "UPI Number",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: black,
                                          ),
                                        ),
                                        //upi number
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: white,
                                        image: DecorationImage(
                                          image: AssetImage("assets/trophy.jpg"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    //assets trophy

                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Rs 551",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //rs 551
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Rewards earned",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // rewards earned
                                  ],
                                ), //u// pi
                              ],
                            ), //icon or text
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 260,
                      top: 40,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: AssetImage("assets/img.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          //profile image
                          Positioned(
                            left: 60,
                            top: 60,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: white,
                              ),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Icon(
                                  Icons.qr_code_2_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: (){
                //     // Navigator.push(context,
                //     //   MaterialPageRoute(builder: (context) => const PaymentMethod()),);
                //   },
                //   borderRadius: BorderRadius.circular(50),
                //   // child: Container(
                //   //   // color: blue,
                //   //   height: Get.height*0.1,
                //   //   width: Get.height*0.1,
                //   //   // width: Get.width*0.9,
                //   //   decoration: BoxDecoration(
                //   //     // borderRadius: BorderRadius.circular(50),
                //   //       shape: BoxShape.circle
                //   //   ),
                //   // ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      SizedBox(
                        height: 220,
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.qr_code_2_outlined,
                                  size: 25,
                                  color: indigo,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Your QR code",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                //your qr code
                              ],
                            ), //icon or text
                            Padding(
                              padding: const EdgeInsets.only(right: 36),
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.6,
                                child: Text(
                                  "Use to receive money from any UPI app",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //use to receive money
                              ),
                            ), //text
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.card_giftcard,
                                  size: 25,
                                  color: indigo,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Invite friends, get rewards",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //invite friend get rewards
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: Get.height * 0.04,
                                    width: Get.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const Maps()),
                                          );
                                        },
                                        child: Text(
                                          "Share",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: indigo,
                                          ),
                                        ),
                                      ),
                                      //share
                                    ),
                                  ),
                                )
                                //share
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 36),
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.6,
                                child: Text(
                                  "Share your code 8x10S",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //share your code
                              ),
                            ),
                            //share your code
                          ],
                        ),
                      ), //icon or text
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.motion_photos_auto_outlined,
                                  size: 25,
                                  color: indigo,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Autopay",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                //auto pay
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 36),
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.6,
                                child: Text(
                                  "Hassle free automatic payments",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // hassle free
                              ),
                            ),
                          ],
                        ),
                      ), //icon or text
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.12,
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.payment,
                                  size: 25,
                                  color: indigo,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 45,
                                  width: Get.width * 0.4,
                                  child: Text(
                                    "Pay with credit or debit cards",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //pay with
                                SizedBox(
                                  width: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Container(
                                    height: Get.height * 0.02,
                                    width: Get.width * 0.12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: indigo,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 115),
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.4,
                                child: Text(
                                  "Bills, online shopping and more",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //bills online
                              ),
                            ),
                          ],
                        ),
                      ), //icon or text
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: Get.height * 0.04,
                        width: Get.width,
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 25,
                              color: indigo,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Setting",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            //setting
                          ],
                        ),
                      ), //icon or text
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: Get.height * 0.04,
                        width: Get.width,
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 25,
                              color: indigo,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Manage Google account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            //manage google
                          ],
                        ),
                      ), //icon or text
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: Get.height * 0.04,
                        width: Get.width,
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_outline,
                              size: 25,
                              color: indigo,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Get help",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            //get help
                          ],
                        ),
                      ), //icon or text
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: Get.height * 0.08,
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 25,
                                  color: indigo,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Language",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                //setting
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 46),
                              child: Container(
                                child: Text(
                                  "English",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            //english
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ), //icon or text
                    ],
                  ),
                ),
              ],
            ),
            Positioned(top: 215,right:10,left: 10,
              child: Card(elevation: 10,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Set up payment methods 1/3",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                ),
                              ),
                              //set up

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const BankAccount()),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.indigo,
                                ),
                              ),SizedBox(width: 20,)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const BankAccount()),
                                  );
                                },
                                child: Container(
                                    height: Get.height * 0.2,
                                    width: Get.width * .3,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Icon(
                                          Icons.account_balance,
                                          size: 30,
                                          color: indigo,
                                        ),
                                        SizedBox(height: 33),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(
                                            "Bank account",textAlign:TextAlign.center ,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "1 account",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Get.height * 0.2,
                                width: Get.width * .3,
                                child: Column(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        DottedBorder(
                                          borderType: BorderType.Circle,
                                          strokeWidth: 1,
                                          dashPattern: [5, 3],
                                          radius: Radius.circular(12),
                                          padding: EdgeInsets.all(6),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(25),
                                              color: unique,
                                            ),
                                            child: Icon(
                                              Icons.add_card,
                                              size: 30,
                                              color: black,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 40,
                                          top: 40,
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              color: white,
                                            ),
                                            child: Icon(
                                              Icons.add_circle,
                                              size: 25,
                                              color: indigo,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 90,
                                      child: Text(
                                        "RuPay credit card",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Pay with UPI",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){

                                  print("111");
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const UpiLite()),);
                                  showModalBottomSheet(
                                      isDismissible: false,
                                      enableDrag: false,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              topLeft: Radius.circular(25))),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: Get.height*0.43,
                                          width: Get.width,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: Container(
                                                  height: Get.height*0.24,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue.withOpacity(0.1),
                                                      borderRadius:
                                                      BorderRadius.circular(15)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Icon(Icons.info_outline,size: 30,color: black,),
                                                        SizedBox(width: 20,),
                                                        Container(
                                                          height: Get.height*0.2,
                                                          width: Get.width*0.6,
                                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text("Add more UPI IDs to set up UPI Lite",
                                                                style: textStyle4,),
                                                              Text("Existing UPI ID for the "
                                                                  "selected bank account does "
                                                                  "not supported UPI Lite",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: Colors.black87
                                                                ),),
                                                              Container(
                                                                height: Get.height*0.05,
                                                                width: Get.width*0.55,
                                                                child: Text("Learn more about extra UPI IDs",
                                                                  style: textStyle5,),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: Get.height * 0.052,
                                                width: Get.width * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: blue,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Add UPI IDs & continue",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 15,),
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: Get.height * 0.052,
                                                  width: Get.width * 0.9,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(color: black),
                                                    color: white,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Dismiss",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: indigo,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * .3,
                                  child: Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          DottedBorder(
                                            borderType: BorderType.Circle,
                                            strokeWidth: 1,
                                            dashPattern: [5, 3],
                                            radius: Radius.circular(12),
                                            padding: EdgeInsets.all(6),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(25),
                                                color: unique,
                                              ),
                                              child: Icon(
                                                Icons.double_arrow_outlined,
                                                size: 30,
                                                color: black,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 40,
                                            top: 40,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                color: white,
                                              ),
                                              child: Icon(
                                                Icons.add_circle,
                                                size: 25,
                                                color: indigo,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 90,
                                        child: Text(
                                          "UPI Lite",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Pay PIN-free",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReferralCode()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GetHelp()),
        );
        break;
      case 2:
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
//switch case
}
