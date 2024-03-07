
import 'package:flutter/material.dart';

var unique = Color(0x7973BEE3);
var darkgreen = Color(0xFF074D07);
var darkblue = Color(0xFF10277E);
var red = Colors.red;
var indigo = Colors.indigo;
var green = Colors.green;
var blue = Colors.blue;
var white = Colors.white;
var black = Colors.black;
var buttonColor = Colors.white;
var backgroundColor = Colors.white;
var iconColor = Colors.blue;
var textColor = Colors.black;
var texColor = Color(0xff771b1b);

var padding = EdgeInsets.all(10);

var textStyle1 = TextStyle(
  color: black,
  fontSize: 14,
  fontWeight: FontWeight.bold


);
var textStyle2 = TextStyle(
  color: white,
  fontSize: 20,
  fontWeight: FontWeight.bold


);
var textStyle3 = TextStyle(
  color: black,
  fontSize: 22,
  fontWeight: FontWeight.bold


);
var decor=BoxDecoration(
color: Colors.red,
border: Border.all(color: Colors.black,width: 2),);


class appStyle{

  var buttonHeight = 20;
  var fontSize20 = 18.0;

}

var loader = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    CircularProgressIndicator(),

    SizedBox(height: 15,),

    Text(
      "Loading...",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
      ),
    ),
  ],
);