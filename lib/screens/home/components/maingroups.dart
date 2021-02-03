import 'package:flutter/material.dart';
import 'package:serviceonex/constants.dart';

class MainGroupList extends StatefulWidget {
  //MainGroupList({Key key}) : super(key: key);

  @override
  _MainGroupListState createState() => _MainGroupListState();
}

class _MainGroupListState extends State<MainGroupList> {
  int selectedMainGroup = 0;

  List<String> categories = ["New Task(s)", "Pending Task(s)"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double maingroupHeight = size.height * 0.10;
    return Container(
        //decoration: BoxDecoration(color: kSecondaryColor),
        height: maingroupHeight,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildMainGroup(index, context)));
  }

  Padding buildMainGroup(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMainGroup = index;
          });
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(categories[index],
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == selectedMainGroup
                      ? kTextColor
                      : Colors.black.withOpacity(0.4))),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            height: 6,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == selectedMainGroup
                  ? kSecondaryColor
                  : Colors.transparent,
            ),
          )
        ]),
      ),
    );
  }
}
