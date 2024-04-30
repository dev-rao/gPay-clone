import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomePage.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    print("Rao saab");

    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomePage()),);
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Image.asset("assets/googlePay.png"),
      ),
    );
  }
}
