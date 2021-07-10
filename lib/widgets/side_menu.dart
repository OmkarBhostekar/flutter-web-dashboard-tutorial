import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_dashboard_tutorial/constants/controllers.dart';
import 'package:web_dashboard_tutorial/constants/style.dart';
import 'package:web_dashboard_tutorial/helpers/responsiveness.dart';
import 'package:web_dashboard_tutorial/routing/routes.dart';
import 'package:web_dashboard_tutorial/widgets/custom_text.dart';
import 'package:web_dashboard_tutorial/widgets/side_menu_items.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                        child: CustomText(
                      text: "Dash",
                      textSize: 20,
                      fontWeight: FontWeight.bold,
                      color: active,
                    )),
                    SizedBox(
                      width: _width / 48,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  color: lightGrey.withOpacity(.1),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItems
                      .map((itemName) => SideMenuItem(
                          itemName: itemName == AuthenticationPageRoute
                              ? "Log Out"
                              : itemName,
                          onTap: () {
                            if (itemName == AuthenticationPageRoute) {
                              // TODO:: go to authentication page
                            }
                            if (!menuController.isActive(itemName)) {
                              menuController.changeActiveItemTo(itemName);
                              if (ResponsiveWidget.isSmallScreen(context))
                                Get.back();
                              // TODO :: go to item name route
                            }
                          }))
                      .toList(),
                )
              ],
            )
        ],
      ),
    );
  }
}
