import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';
import 'package:gpayclone/Screens/PaymentCategories.dart';
import 'package:gpayclone/Screens/Profile.dart';
import 'package:gpayclone/Screens/QRcode.dart';
import 'package:gpayclone/Screens/UpiLite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final code = "Copy your code 8x10S";
  List isChange = [false,false,false,false,false,false,false,false];

  List name = [
    "Scan any QR code",
    "Pay contacts",
    "Pay phone number",
    "Bank transfer",
    "Pay UPI ID or number",
    "Self transfer",
    "Pay bills",
    "Mobile recharge"
  ];
  List icon = [
    Icons.qr_code_scanner,
    Icons.phone,
    Icons.send_to_mobile,
    Icons.account_balance,
    Icons.alternate_email_rounded,
    Icons.person,
    Icons.receipt_long_sharp,
    Icons.mobile_screen_share
  ];
  List people = [
    {"contact": "Apple"},
    {"contact": "Boy"},
    {"contact": "Cat"},
    {"contact": "Dog"},
    {"contact": "Eye"},
    {"contact": "Fish"},
    {"contact": "Girl"},
    {"contact": "Hen"},
    {"contact": "Ice"},
    {"contact": "Jug"},
    {"contact": "Kite"},
    {"contact": "Lion"},
    {"contact": "Man"},
    {"contact": "Nest"},
    {"contact": "Owl"},
    {"contact": "Pig"},
  ];
  List view = [
    {"icon": Icons.tv,
      "bills": "DTH/Cable TV"},
    {"icon": Icons.lightbulb_outline_sharp,
      "bills": "Electricity"},
    {"icon": Icons.phone_android_outlined,
      "bills": "Postpaid mobile"},
    {"icon": Icons.router_outlined,
      "bills": "Broadband/ Landline"},

  ];
  List colorList = [];

  bool seeMore = false;
  bool seeMore1 = false;
  int rnd = 0;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isConnected = false;

  @override
  initState() {
    print("Rao Saa");
    colorList= List.generate(Colors.primaries.length, (index) => Colors.primaries[index]);
    rnd = Random().nextInt(Colors.primaries.length);
    print("Saheb"+Colors.primaries.length.toString());

    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    super.initState();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
      print("initConnectivity --> $result");
    } on PlatformException catch (e) {
      print("Exception : $e");
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      print("_connectionStatus : $_connectionStatus");
      if(result == ConnectivityResult.none){
        isConnected = false;
      }
      else{
        isConnected = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: isConnected == false
          ? Center(
          child: Image.asset("assets/no_internet.jpg",
          width: Get.width*0.85,
          ))
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.35,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/gpayBanner.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Card(elevation: 2,
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search your billers",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: Icon(Icons.search, color: black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: (){
                          print("111");
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Profile()),);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage("assets/img.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //banner//image
            SizedBox(
              height: 6,
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1),
                  itemCount: name.length,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: InkWell(
                        onTap: (){
                          // if (index ==0)
                          setState((){
                            isChange[index] = !isChange[index];
                          });
                          print("Gajsa");
                          if(index==0)
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const QRcode()),);
                          // else if(index==1)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEditBank()),);
                          // else if(index==2)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const SendReceive()),);
                          // else if(index==3)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const PayThings()),);
                          // else if(index==4)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageYour()),);
                          // else if(index==5)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const FixaProblem()),);
                          // else if(index==6)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const Rewards()),);
                          // else if(index==7)
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const FraudPrevention()),);
                          // else
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen()),);


                        },

                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(icon[index],size: 25, color: darkblue),
                              SizedBox(
                                height: 8,
                              ),
                              Text(name[index],
                                  textAlign: TextAlign.center, style: textStyle1),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //gridview qr,pay
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
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
                                    color: darkblue,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      strokeWidth: 0,
                      dashPattern: [5,4],
                      radius: Radius.circular(15),
                      padding: EdgeInsets.all(1),
                      child: Container(
                        height: Get.height * 0.044,
                        width: Get.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Text("Activate UPI Lite",
                                  textAlign: TextAlign.center, style: textStyle1),
                              SizedBox(width: 15,),
                              Icon(Icons.add_circle_outline,color: black,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // active upi
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text("UPI ID: raogajendra",
                        textAlign: TextAlign.center, style: textStyle1),
                  ),
                ),
                // upi id
              ],
            ),
            //row/upi/

            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("People", style: textStyle3),
              ),
            ),
            //people
            SizedBox(
              height: 10,
            ),
            Container(
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemCount: seeMore == true
                    ? people.length
                    : people.length < 4
                    ? people.length
                    : 8,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.primaries[index],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        // color of grid items
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            seeMore == false
                                ? index == 7
                                ? GestureDetector(
                              onTap: () {
                                if (index == 7) {
                                  setState(() {
                                    seeMore = !seeMore;
                                  });
                                }
                              },
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: seeMore == false
                                      ? Icon(seeMore
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                    color: indigo,size: 30,)
                                      : Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        left: 23,
                                        top: 20),
                                    child: Text(
                                      people[index]
                                      ["contact"]
                                          .toString()
                                          .substring(0, 1),
                                      style: textStyle2,
                                    ),
                                  )),
                            )
                                : Text(
                              people[index]["contact"]
                                  .toString()
                                  .substring(0, 1),
                              style: textStyle2,
                            )
                                : index == people.length-1
                                ? GestureDetector(
                              onTap: () {
                                if (index == people.length-1) {
                                  setState(() {
                                    seeMore = !seeMore;
                                  });
                                }
                              },
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: seeMore == true
                                      ? Icon(seeMore
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                    color: indigo,size: 30,)
                                      : Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 23, top: 20),
                                    child: Text(
                                      people[index]["contact"]
                                          .toString()
                                          .substring(0, 1),
                                      style: textStyle2,
                                    ),
                                  )),
                            )
                                : Text(
                              people[index]["contact"]
                                  .toString()
                                  .substring(0, 1),
                              style: textStyle2,
                            )
                            // color of grid items
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          index == 7
                              ? seeMore == false
                              ? "More"
                              : people[index]["contact"]
                              :  index == people.length-1
                              ? seeMore == true
                              ? "Less"
                              : people[index]["contact"]
                              : people[index]["contact"],
                          style: textStyle1)
                    ],
                  );
                },
              ),
            ),
            //grid people
            //
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: Get.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Businesses", style: textStyle3),
                  ),
                ),
                //business
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.withOpacity(0.4),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 25,
                          ),
                        ),

                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ), SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                // explore
              ],
            ),
            //business, Explore
            SizedBox(
              height: 15,
            ),
            Container(
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemCount: seeMore1 == true
                    ? people.length
                    : people.length < 4
                    ? people.length
                    : 4,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.primaries[index],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        // color of grid items
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            seeMore1 == false
                                ? index == 3
                                ? GestureDetector(
                              onTap: () {
                                if (index == 3) {
                                  setState(() {
                                    seeMore1 = !seeMore1;
                                  });
                                }
                              },
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    border: Border.all(color: Colors.grey)
                                  ),
                                  child: seeMore1 == false
                                      ? Icon(seeMore1
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                    color: indigo,size: 30,)
                                      : Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        left: 23,
                                        top: 20),
                                    child: Text(
                                      people[index]
                                      ["contact"]
                                          .toString()
                                          .substring(0, 1),
                                      style: textStyle2,
                                    ),
                                  )),
                            )
                                : Text(
                              people[index]["contact"]
                                  .toString()
                                  .substring(0, 1),
                              style: textStyle2,
                            )
                                : index == people.length-1
                                ? GestureDetector(
                              onTap: () {
                                if (index == people.length-1) {
                                  setState(() {
                                    seeMore1 = !seeMore1;
                                  });
                                }
                              },
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(50),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: seeMore1 == true
                                      ? Icon(seeMore1
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: indigo,size: 30,)
                                      : Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 23, top: 20),
                                    child: Text(
                                      people[index]["contact"]
                                          .toString()
                                          .substring(0, 1),
                                      style: textStyle2,
                                    ),
                                  )),
                            )
                                : Text(
                              people[index]["contact"]
                                  .toString()
                                  .substring(0, 1),
                              style: textStyle2,
                            )
                            // color of grid items
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          index == 3
                              ? seeMore1 == false
                              ? "More"
                              : people[index]["contact"]
                              :  index == people.length-1
                              ? seeMore1 == true
                              ? "Less"
                              : people[index]["contact"]
                              : people[index]["contact"],
                          style: textStyle1)
                    ],
                  );
                },
              ),
            ),
            //GridView business
            SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Bills & recharges", style: textStyle3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "No bills due.Try adding these!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // bills & Recharge
            SizedBox(
              height: 20,
            ),
            Container(
              height: 130,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // color of grid items
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  view[index]["icon"],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 70,
                              child: Text(view[index]["bills"],
                                  textAlign: TextAlign.center,
                                  style: textStyle1),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            //listview
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: black),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                ),
                onPressed: () {
                  print("Check 222");

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PaymentCategories()),);
                },
                child: Text("See all",
                    style: TextStyle(
                      fontSize: appStyle().fontSize20,
                      fontWeight: FontWeight.bold,
                      color: darkblue,
                    ))),
            //see all
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Offers & rewards", style: textStyle3),
              ),
            ),
            //offers & rewards
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/rewards.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      //assets reward
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Rewards",
                        style: textStyle1,
                      )
                      // reward
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/Offers.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      //assets offers
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Offers",
                        style: textStyle1,
                      )
                      // offers
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/referrals.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      // assets referrals
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Referrals",
                        style: textStyle1,
                      )
                    //  referrals
                    ],
                  ),
                ],
              ),
            ),
            // rewards offers, referrels logo
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Manage your money", style: textStyle3),
              ),
            ),
            // manage money
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      child: Icon(
                    Icons.speed,
                    color: darkblue,
                    size: 25,
                  )),
                ),
                //icon
                Container(
                  width: Get.width * 0.7,
                  child: Text(
                    "Check your CIBILE score for free",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Cibile
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
              ],
            ),
            //cibile
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      child: Icon(
                    Icons.history,
                    color: darkblue,
                    size: 25,
                  )),
                ),
                 //icon
                Container(
                  width: Get.width * 0.7,
                  child: Text(
                    "See transaction history",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 // trans history
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
              ],
            ),
            //history
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      child: Icon(
                    Icons.account_balance_outlined,
                    color: darkblue,
                    size: 25,
                  )),
                ),
                 //icon
                Container(
                  width: Get.width * 0.7,
                  child: Text(
                    "Check bank balance",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 //check balance
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
              ],
            ),
            //check balance
            SizedBox(
              height: 25,
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
                        "Invite friends to get Rs 51",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ), //invite 51
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Container(
                      child: Text(
                        "Invite friends to Google Pay and get Rs.51 when your friend sends their first payment. They get Rs.21!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ), //text invite friends
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Clipboard.setData(ClipboardData(text: code));
                        var snackbar = SnackBar(content: Text("Copied to clipboard"),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      child: Row(
                        children: [
                          Text(
                            code,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Icon(
                            Icons.copy_rounded,
                            color: black,
                          )
                        ],
                      ),
                    ),
                  ), //copy your code
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 40),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: black),
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
                        child: Text("Invite",
                            style: TextStyle(
                              fontSize: appStyle().fontSize20,
                              fontWeight: FontWeight.bold,
                              color: darkblue,
                            ))),
                  ), //elevated invite
                ],
              ),
            ),
            // banner

            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: Get.width,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Showing businesses based on your location -",
                        style: textStyle1,
                      ),
                    ),
                  ),
                  Text(
                    "Learn more",
                    style: textStyle1,
                  ),
                  //learn more
                ],
              ),
            ),
            //based on location
          ],
        ),
      ),
    );
  }
}
