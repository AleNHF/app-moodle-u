import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/utils/app_bar.dart';
import 'package:uagrm_app_moodle/views/calendar/view/calendar_view.dart';
import 'package:uagrm_app_moodle/views/courses/view/course_view.dart';
import 'package:uagrm_app_moodle/views/home/view/home_view.dart';
import 'package:uagrm_app_moodle/router/app_routes.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[HomeView(), CourseView(), ExamplePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'UAGRM - Virtual',
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: _buildBottomNavBarItems(context),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight,
          ),
          child: _widgetOptions.elementAt(_selectedIndex),
        )));
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems(BuildContext context) {
    List<BottomNavigationBarItem> items = [];

    for (final option in AppRoutes.menuOptions) {
      if (option.route != 'bottomapp') {
        items.add(BottomNavigationBarItem(
            backgroundColor: AppColors.optionalColor,
            icon: Icon(option.icon),
            label: option.name));
      }
    }

    return items;
  }
}
