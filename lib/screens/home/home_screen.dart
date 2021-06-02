import 'package:flutter/material.dart';
import 'package:serviceonex/components/side_menu.dart';
import 'package:serviceonex/responsive.dart';
import 'package:serviceonex/screens/task_detail/task_detail_screen.dart';

import 'components/list_of_tasks.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/main_screen";

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: ListOfTasks(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfTasks(),
            ),
            Expanded(
              flex: 9,
              child: TaskDetailScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfTasks(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: TaskDetailScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
