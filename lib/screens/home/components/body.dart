import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serviceonex/screens/home/components/categories.dart';
import 'package:serviceonex/screens/home/components/maingroups.dart';

//https://github.com/abuanwar072/Movie-Info---Flutter-UI
//https://www.youtube.com/watch?v=OgSLd2lH1FM&t=369s

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MainGroupList(),
        SizedBox(
          height: 10,
        ),
        CategoryList()
      ],
    );
  }
}
