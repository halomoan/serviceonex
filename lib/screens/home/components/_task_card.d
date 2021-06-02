import 'package:flutter/material.dart';
import 'package:serviceonex/models/Task.dart';
import 'package:websafe_svg/websafe_svg.dart';

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
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(task.images[0]),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    task.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : null,
                        ),
                  )
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            if (!task.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),
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
      ),
    );
  }
}
