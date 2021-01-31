import 'package:flutter/material.dart';
import 'package:serviceonex/constants.dart';
import 'package:serviceonex/screens/sign_in/sign_in_screen.dart';
import 'package:serviceonex/screens/splash/components/splash_content.dart';
import 'package:serviceonex/size_config.dart';

import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to ServiceONE",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "UOL Maintenance Solution",
      "image": "assets/images/splash_1.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]['image'],
                    text: splashData[index]['text']),
              )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      }),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
      duration: kAnimationDuration,
    );
  }
}
