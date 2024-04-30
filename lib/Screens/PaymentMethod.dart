import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/GetHelp.dart';
import 'package:gpayclone/Screens/PaymentMethod.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
        padding: const EdgeInsets.only(left: 5,right: 10,top: 10),
        child: InkWell(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaymentMethod()),);
          },
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
              ), //sbi logo
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
                ), //text
              ),
            ],
          ),
        ),
      ),
    );
  }
  SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaymentMethod()),
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
    // switch (item) {
    //   case 2:
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const ReferralCode()),
    //     );
    //     break;
    // }
  }
}
