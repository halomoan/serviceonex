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

enum SortOption { ByDate, ByLocation }

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
  List<Task> _displayTask;
  bool searchMode = false;
  bool sortDesc = true;
  SortOption sortBy = SortOption.ByDate;
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

  void sortResults() {
    if (sortBy == SortOption.ByDate) {
      this.tasks.sort((Task a, Task b) {
        if (this.sortDesc) {
          return DateTime.parse(b.startDate)
              .compareTo(DateTime.parse(a.startDate));
        } else {
          return DateTime.parse(a.startDate)
              .compareTo(DateTime.parse(b.startDate));
        }
      });
    } else if (sortBy == SortOption.ByLocation) {
      this.tasks.sort((Task a, Task b) {
        if (this.sortDesc) {
          return b.locID > a.locID ? 1 : 0;
        } else {
          return b.locID > a.locID ? 0 : 1;
        }
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
                    // MaterialButton(
                    //   minWidth: 10,
                    //   onPressed: () {},
                    //   child: WebsafeSvg.asset(
                    //     "assets/icons/Angle down.svg",
                    //     width: 20,
                    //   ),
                    // ),
                    SortMenuList(
                      sortOption: this.sortBy,
                      onMenuSelected: (SortOption value) {
                        this.sortBy = value;
                        this.sortResults();
                        setState(() {});
                      },
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        this.sortDesc = !this.sortDesc;
                        this.sortResults();
                        setState(() {});
                      },
                      child: WebsafeSvg.asset(
                        this.sortDesc
                            ? "assets/icons/sortDesc.svg"
                            : "assets/icons/sortAsc.svg",
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

class SortMenuList extends StatelessWidget {
  final SortOption sortOption;
  final Function(SortOption) onMenuSelected;

  const SortMenuList({@required this.sortOption, this.onMenuSelected});

  String _getText() {
    String _selectedMenu;
    switch (this.sortOption) {
      case SortOption.ByDate:
        {
          _selectedMenu = "Sort By Date";
        }
        break;
      case SortOption.ByLocation:
        {
          _selectedMenu = "Sort By Location";
        }
        break;
    }
    return _selectedMenu;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          PopupMenuButton(
              tooltip: 'Sort',
              child: WebsafeSvg.asset(
                "assets/icons/Angle down.svg",
                width: 20,
                color: Colors.black,
              ),
              onSelected: (value) {
                onMenuSelected(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: SortOption.ByDate,
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.black54,
                              size: 22.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Text(
                                "Sort By Date",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        )),
                    PopupMenuItem(
                        value: SortOption.ByLocation,
                        child: Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.black54,
                              size: 22.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Text(
                                "Sort By Location",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ]),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              _getText(),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
