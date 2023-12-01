import 'package:flutter/material.dart';

abstract class Styles {
//Color
  // static const Color lightgrey = Color(0xFF8F949F);
  static const Color bgtextfield = Color(0xFFF3F5F6);

  static const Color bgcolor = Colors.white;
  static const Color black = Colors.black;
  static const Color lightgrey = Color.fromRGBO(143, 148, 159, 1);
  static const Color darkgrey = Color.fromRGBO(75, 85, 99, 1);
  static const Color blue = Color.fromRGBO(48, 86, 211, 1);
  static const Color red = Color.fromRGBO(224, 34, 34, 1);
  static const Color whiteblue = Color.fromRGBO(239, 243, 253, 1);

  static const TextStyle text32 = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0,
  );

  static const TextStyle labelTextField = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static const TextStyle text10 = TextStyle(
    color: Color(0xFF4B5563),
    fontSize: 10,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static const TextStyle linktext10 = TextStyle(
    color: Color(0xFF3056D3),
    fontSize: 10,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static const TextStyle HeaderText = TextStyle(
    fontFamily: "Inter",
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: Color(0xFF000000),
  );

  static const TextStyle Text16 = TextStyle(
    fontFamily: "Inter",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF000000),
  );

  static const TextStyle headerarticle = TextStyle(
    fontFamily: "Inter",
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(48, 86, 211, 1),
  );
  static const TextStyle titlearticledetail = TextStyle(
    fontFamily: "Inter",
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(17, 25, 40, 1),
  );

  //Input Text
  static const TextStyle inputTextDefaultTextStyle = TextStyle(
    fontFamily: "Inter",
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Color(0xFF000000),
  );
  static const TextStyle inputTextHintDefaultTextStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xFF857B7B));
  static const Color inputTextDefaultBackgroundColor =
      Color.fromRGBO(243, 245, 246, 0.3);

  //Button
  static const TextStyle buttonDefaultTextStyle = TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: Color(0xFFFFFFFF),
  );
  static const Color buttonDefaultBackgroundColor = blue;

  static const TextStyle linkTextStyle = TextStyle(
    fontFamily: "Inter",
    fontSize: 10,
    color: blue,
    fontWeight: FontWeight.w400,
  );

  //detail
  static const TextStyle detailTextStyle = TextStyle(
    fontFamily: "Inter",
    fontSize: 10,
    color: darkgrey,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle subheaderTextStyle = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    color: darkgrey,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle detailLinkTextStyle = TextStyle(
    fontFamily: "Inter",
    fontSize: 10,
    color: blue,
    fontWeight: FontWeight.w400,
  );
}
