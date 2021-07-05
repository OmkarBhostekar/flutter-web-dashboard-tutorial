import 'package:flutter/material.dart';
import 'package:web_dashboard_tutorial/helpers/responsiveness.dart';
import 'package:web_dashboard_tutorial/widgets/large_screen.dart';
import 'package:web_dashboard_tutorial/widgets/small_screen.dart';
import 'package:web_dashboard_tutorial/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      appBar: topNavigationBar(context, scaffoldKey),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
