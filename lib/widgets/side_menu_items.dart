import 'package:flutter/material.dart';
import 'package:web_dashboard_tutorial/helpers/responsiveness.dart';
import 'package:web_dashboard_tutorial/widgets/horizontal_menu_item.dart';
import 'package:web_dashboard_tutorial/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context))
      return VerticalMenuItem(itemName: itemName, onTap: onTap);

    return HorizonMenuItem(itemName: itemName, onTap: onTap);
  }
}
