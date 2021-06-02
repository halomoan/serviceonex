import 'package:flutter/material.dart';
import 'package:serviceonex/size_config.dart';

const kPrimaryColor = Color(0xFF366CF6);
const kSecondaryColor = Color(0xFFF5F6FC);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kBgLightColor = Color(0xFFF2F4FC);
const kBgDarkColor = Color(0xFFEBEDFA);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);
const kDefaultPadding = 14.0;

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final taskHeadingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(18),
  fontWeight: FontWeight.bold,
  color: Colors.blue,
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
