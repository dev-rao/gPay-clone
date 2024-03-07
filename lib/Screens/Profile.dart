import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/BankAccount.dart';
import 'package:gpayclone/Screens/GetHelp.dart';
import 'package:gpayclone/Screens/ReferralCode.dart';

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
        child: Column(
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
                              height: 20,
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
                        ),
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
                          child: Icon(
                            Icons.qr_code_2_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                ),
                Positioned(
                  left: 12,
                  right: 10,
                  top: -20,
                  child: Column(
                    children: [
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Container(
                          height: Get.height * 0.3,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    SizedBox(
                                      width: 40,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const BankAccount()),);
                                      },
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.indigo,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Icon(
                                        Icons.account_balance,
                                        size: 30,
                                        color: indigo,
                                      )),
                                      SizedBox(
                                        width: 55,
                                      ),
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          DottedBorder(
                                            borderType: BorderType.Circle,
                                            strokeWidth: 1,
                                            dashPattern: [5,3],
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
                                        width: 60,
                                      ),
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          DottedBorder(
                                            borderType: BorderType.Circle,
                                            dashPattern: [5,3],
                                            strokeWidth: 1,
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
                                                Icons.fast_forward_outlined,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 65,
                                        child: Text(
                                          "Bank account",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      //bank account
                                      Container(
                                        height: 50,
                                        width: 85,
                                        child: Text(
                                          "RuPay credit card",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      // rupay credit card
                                      Container(
                                        height: 60,
                                        width: 100,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "UPI Lite",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            //upi lite
                                            Text(
                                              "Pay PIN-free",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            //pay pin free
                                          ],
                                        ),
                                      ),
                                      //upi lite
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1 account",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //1 account
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Text(
                                      "Pay with UPI",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // pay with upi
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                            ),
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
                            ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    height: Get.height * 0.04,
                                    width: Get.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Share",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: indigo,
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
                      ),
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
                                  width: Get.width*0.4,
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
                      ),
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
                      ),
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
                      ),
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
                      ),
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
                                  "Setting",
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
                      ),
                    ],
                  ),
                ),
              ],
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
    }
    switch (item) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GetHelp()),
        );
        break;
    }
    switch (item) {
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReferralCode()),
        );
        break;
    }
  }
  //switch case
}
