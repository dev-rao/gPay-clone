import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpayclone/Helper/Constants.dart';

class GetHelp extends StatefulWidget {
  const GetHelp({super.key});

  @override
  State<GetHelp> createState() => _GetHelpState();
}

class _GetHelpState extends State<GetHelp> {

  final scrollController = ScrollController();
  bool showText = false;

  initState() {
    print("hjgkjhgjhg,jhg");

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){

        setState(() {
          print("Scrolling.....");
          showText=true;
        });

      }
      else{
        setState(() {
          print("Scrolling.....Back");
          showText=false;
        });
      }
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: Text(showText == false?"":"Google Pay Help",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: black
          ),),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: Get.height*0.2,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/gpayBanner.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment:Alignment.topLeft ,height: 50,width: 120,
                      child: Text("Google Pay Help",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.topLeft,height: 70,width: 150,
                      child: Text("Get help with payments, rewards, and more",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: Get.height*0.05,
              width: Get.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: darkblue,
              ),
              child: Center(
                child: Text("Having issues?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Top questions",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                Container(
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
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 250,
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
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20)
                              ), // color of grid items
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Stuck payments",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),)
                          ],
                        ),
                      );
                    }
                    ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.list_alt,size: 25,color: darkblue,),
                    SizedBox(width: 20,),
                    Text("Pay bills using Google Pay",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.list_alt,size: 25,color: darkblue,),
                    SizedBox(width: 20,),
                    Text("Fix problems with transaction",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.list_alt,size: 25,color: darkblue,),
                    SizedBox(width: 20,),
                    Text("Add or remove payment methods",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.list_alt,size: 25,color: darkblue,),
                    SizedBox(width: 20,),
                    Text("Google Pay India Grievances",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.list_alt,size: 25,color: darkblue,),
                    SizedBox(width: 20,),
                    Text("Fix problems with rewards",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Icon(Icons.list_alt,size: 25,color: darkblue,),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: Get.height*0.05,
                      width: Get.width*0.7,
                      child: Text("Protection against Fraud or Unauthorised activity",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
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
                        "Talk to our specialist team",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
}
