import 'package:flutter/material.dart';
import 'package:serviceonex/models/Task.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:serviceonex/size_config.dart';

import '../../../constants.dart';
import '../../../extensions.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
    this.isActive = true,
    this.task,
    this.press,
  }) : super(key: key);

  final bool isActive;
  final Task task;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(6, 2),
                    color: Color.fromRGBO(0, 0, 0, 0.2)),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: taskHeadingStyle),
                Text(task.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      height: 1.5,
                    )),
                Text(task.startDate + "  " + task.startTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      height: 1.5,
                    )),
                Text(task.status,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      height: 1.5,
                    ))
              ],
            ),
          ),
          if (!task.isChecked)
            Positioned(
                right: 10,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                )),
          if (task.tagColor != null)
            Positioned(
              left: 8,
              top: 0,
              child: WebsafeSvg.asset(
                "assets/icons/Markup filled.svg",
                height: 18,
                color: task.tagColor,
              ),
            )
        ],
      ),
    );
  }
}
