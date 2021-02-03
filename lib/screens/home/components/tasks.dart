import 'dart:convert';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  //Tasks({Key key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  Future<List<Widget>> createList() async {
    List<Widget> items = new List<Widget>();
    String dataString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");
    List<dynamic> dataJSON = jsonDecode(dataString);

    dataJSON.forEach((object) {
      items.add(Padding(
        padding: EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 2.0, blurRadius: 5.0),
              ]),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                child: Image.network(
                  object["Images"][0],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(object["Desc"]),
                ],
              )
            ],
            mainAxisSize: MainAxisSize.max,
          ),
        ),
      ));
    }); //forEach

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double containerHeight = size.height - (size.height * 0.28);
    return Container(
        height: containerHeight,
        child: FutureBuilder(
          initialData: <Widget>[Text("")],
          future: createList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: snapshot.data,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
