import 'package:flutter/material.dart';
import 'package:serviceonex/routes.dart';
import 'package:serviceonex/screens/splash/splash_screen.dart';

import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: buildThemeData(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
