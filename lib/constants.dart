import 'package:flutter/material.dart';
import 'package:serviceonex/size_config.dart';

//https://github.com/abuanwar072/E-commerce-Complete-Flutter-UI

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
//const kSecondaryColor = Color(0xFF979797);
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Colors.black;
const kDefaultPadding = 20.0;

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp kSOneIDRegExp = RegExp(r"^[0-9]+$");
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kSOneIDNullError = "Please Enter Your ServiceONE ID";
const String kInvalidSOneID = "Please Enter Valid ServiceONE ID";
const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
