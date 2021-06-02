import 'package:flutter/material.dart';
import 'package:serviceonex/components/side_menu.dart';
import 'package:serviceonex/helpers/utils.dart';
import 'package:serviceonex/models/Task.dart';
import 'package:serviceonex/responsive.dart';
import 'package:serviceonex/screens/task_detail/task_detail_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import 'task_card.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({
    Key key,
  }) : super(key: key);

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<Task> tasks = Utils.getMockTasks();
  List<Task> _tasks;
  bool searchMode = false;
  final controller = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void filterSearchResults(String query) {
    if (query.length != 0) {
      setState(() {
        searchMode = true;
        _tasks = tasks
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()) ||
                item.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        searchMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Seearch bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          this.filterSearchResults(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: searchMode
                              ? GestureDetector(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    controller.clear();
                                    setState(() {
                                      searchMode = false;
                                    });
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding * 0.5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    MaterialButton(
                      minWidth: 10,
                      onPressed: () {},
                      child: WebsafeSvg.asset(
                        "assets/icons/Angle down.svg",
                        width: 20,
                      ),
                    ),
                    Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: WebsafeSvg.asset(
                        "assets/icons/Sort.svg",
                        width: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding * 0.5),
              Expanded(
                child: ListView.builder(
                  itemCount: searchMode ? _tasks.length : tasks.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder: (context, index) => TaskCard(
                    isActive: Responsive.isMobile(context) ? true : index == 0,
                    task: searchMode ? _tasks[index] : tasks[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                //TaskDetailScreen(task: tasks[index]),
                                Container()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
