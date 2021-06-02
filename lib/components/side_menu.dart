import 'package:flutter/material.dart';

import 'package:serviceonex/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatefulWidget {
  SideMenu({Key key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var selectedMenu = "";

  setSelectedMenu(menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/serviceonelogo.png",
                    width: 52,
                  ),
                  Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kPrimaryColor,
                onPressed: () {},
                icon: WebsafeSvg.asset("assets/icons/CreateWO.svg",
                    width: 24, color: Colors.white),
                label: Text(
                  "Create Work Order",
                  style: TextStyle(color: Colors.white),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
              ),
              /*SizedBox(height: kDefaultPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kBgDarkColor,
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.download,
                ),
                label: Text(
                  "Get messages",
                  style: TextStyle(color: kTextColor),
                ),
              ).addNeumorphism(), */
              SizedBox(height: kDefaultPadding * 2),
              // Menu Items
              SideMenuItem(
                press: () {
                  setSelectedMenu("MyWO");
                },
                title: "My Work Order",
                iconSrc: "assets/icons/MyWO.svg",
                isActive: selectedMenu == "MyWO",
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {
                  setSelectedMenu("TeamWO");
                },
                title: "MyTeam Work Order",
                iconSrc: "assets/icons/TeamWO.svg",
                isActive: selectedMenu == "TeamWO",
              ),
              SideMenuItem(
                press: () {
                  setSelectedMenu("Settings");
                },
                title: "Settings",
                iconSrc: "assets/icons/Settings.svg",
                isActive: selectedMenu == "Settings",
              ),
              SideMenuItem(
                press: () {
                  setSelectedMenu("Logout");
                },
                title: "Logout",
                iconSrc: "assets/icons/Logout.svg",
                isActive: selectedMenu == "Logout",
                showBorder: false,
              ),

              SizedBox(height: kDefaultPadding * 2),
              // Tags
              // Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
