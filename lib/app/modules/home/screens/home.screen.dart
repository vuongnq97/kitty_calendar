import 'package:my_calender/app/modules/calendar/screens/calendar.screen.dart';
import 'package:my_calender/app/modules/home/controllers/home.controller.dart';
import 'package:my_calender/app/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_calender/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        CalendarScreen(),
        Container(
          child: Text('Screen 2'),
        ),
        Container(
          child: Text('Screen 3'),
        ),
        Container(
          child: Text('Screen 4'),
        ),
        Container(
          child: Text('Screen 5'),
        ),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.calendar_month_outlined),
            title: "Calendar",
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.grey,
            textStyle: TextStyle(fontSize: 16),
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.book),
          title: "Managements",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(fontSize: 16),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: "Add",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
          textStyle: TextStyle(fontSize: 16),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add_chart),
          title: "Challenges",
          activeColorPrimary: Colors.teal,
          textStyle: TextStyle(fontSize: 16),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "Setting",
          textStyle: TextStyle(fontSize: 16),
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          return PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            resizeToAvoidBottomInset: true,
            navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
                ? 0.0
                : kBottomNavigationBarHeight,
            bottomScreenMargin: 0,
            selectedTabScreenContext: (final context1) {},
            backgroundColor: Colors.white,
            hideNavigationBar: _hideNavBar,
            decoration:
                const NavBarDecoration(colorBehindNavBar: Colors.indigo),
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style1, // Choose the nav bar style with this property
          );
        },
      ),
    );
  }
}
