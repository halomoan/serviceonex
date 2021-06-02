import 'package:flutter/widgets.dart';
import 'package:serviceonex/screens/forgot_password/forgot_password_screen.dart';
import 'package:serviceonex/screens/home/home_screen.dart';
import 'package:serviceonex/screens/sign_in/sign_in_screen.dart';
import 'package:serviceonex/screens/sign_up/sign_up_screen.dart';
import 'package:serviceonex/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  MainScreen.routeName: (context) => MainScreen()
};
