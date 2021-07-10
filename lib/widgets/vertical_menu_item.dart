import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_dashboard_tutorial/constants/controllers.dart';
import 'package:web_dashboard_tutorial/constants/style.dart';
import 'package:web_dashboard_tutorial/widgets/custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const VerticalMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("Not Hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? lightGrey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    child: Container(
                      width: 3,
                      height: 72,
                      color: dark,
                    ),
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName),
                      ),
                      if (!menuController.isActive(itemName))
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: menuController.isHovering(itemName)
                              ? dark
                              : lightGrey,
                        ))
                      else
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: dark,
                          textSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                    ],
                  ))
                ],
              ),
            )));
  }
}
