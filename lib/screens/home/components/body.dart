import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serviceonex/constants.dart';

//https://github.com/abuanwar072/Movie-Info---Flutter-UI
//https://www.youtube.com/watch?v=OgSLd2lH1FM&t=369s

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [CategoryList()],
    );
  }
}

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;

  List<String> categories = ["New Task(s)", "Pending Task(s)"];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategory(index, context)));
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(children: [
          Text(categories[index],
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600)),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            height: 6,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == selectedCategory
                  ? kSecondaryColor
                  : Colors.transparent,
            ),
          )
        ]),
      ),
    );
  }
}
