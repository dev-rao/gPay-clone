import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/GetHelp.dart';
import 'package:gpayclone/Screens/ReferralCode.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({super.key});

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  bool showText = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: Text(showText == false?"":"Payment methods",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: black
          ),),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Referral code",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: const Text(
                    "Get help",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const PopupMenuItem<int>(
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Payment methods",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 20,),
            const Text("UPI payments",style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                    width: 85,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: const AssetImage("assets/sbi-logo-.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Container(
                      height: Get.height*0.1,
                      width: Get.width*0.42,
                      child: Column(
                        children: [
                          const Text("State Bank of India 6619",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("Savings account Primary,",
                            style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [6,3],
                    color: blue,
                    child: Container(
                      height: 55,
                      width: 85,
                      child: Icon(
                        Icons.account_balance,
                        size: 25,
                        color: indigo,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Container(
                      height: Get.height*0.06,
                      width: Get.width*0.42,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Add bank account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 10,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [6,3],
                    color: blue,
                    child: Container(
                      height: 55,
                      width: 85,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Rupay-Logo.png"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Container(
                      height: Get.height*0.06,
                      width: Get.width*0.5,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Add RuPay credit card on upi",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 10,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [6,3],
                    color: blue,
                    child: Container(
                      height: 55,
                      width: 85,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/UPI-780x470.webp"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Container(
                      height: Get.height*0.08,
                      width: Get.width*0.5,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Add credit line",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),),
                          Text("Pay with a pre sanctioned credit line",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 10,top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [6,3],
                    color: blue,
                    child: Container(
                      height: 55,
                      width: 85,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/upi images.jpg"),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Container(
                      height: Get.height*0.08,
                      width: Get.width*0.5,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Set up UPI Lite",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),),
                          Text("Pay PIN- free under Rs 500",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
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
}
