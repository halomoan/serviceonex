import 'package:flutter/material.dart';

import 'components/body.dart';

//https://www.youtube.com/watch?v=Cn6VCTaHB-k
//https://github.com/retroportalstudio/flutter_itemstack_listview/blob/master/lib/main.dart

class HomeScreen extends StatelessWidget {
  static String routeName = "home_screen";

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.menu, color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.sort, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: Body(),
      ),
    );
  }
}
