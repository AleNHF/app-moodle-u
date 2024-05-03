import 'package:flutter/material.dart';

import 'package:uagrm_app_moodle/courses/view/course_screen.dart';
import 'package:uagrm_app_moodle/home/view/home_view.dart';
import 'package:uagrm_app_moodle/router/models/menu_option.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'course', view: CourseScreen(), icon: Icons.book)

  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    'home'   : (context) =>  HomeView(),
    'course' : (context) => CourseScreen(),
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: ( BuildContext context ) => option.view});
    }
    return appRoutes;
  }
}