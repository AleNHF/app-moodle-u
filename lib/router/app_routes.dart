import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/utils/bottom_app_bar.dart';
import 'package:uagrm_app_moodle/views/auth/view/login_view.dart';
import 'package:uagrm_app_moodle/views/courses/view/course_view.dart';
import 'package:uagrm_app_moodle/views/home/view/home_view.dart';
import 'package:uagrm_app_moodle/router/models/menu_option.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'login', 
        view: LoginView(), 
        icon: Icons.dashboard, 
        name: 'Login'),
    MenuOption(
        route: 'home', 
        view: HomeView(), 
        icon: Icons.dashboard, 
        name: 'Home'),
    MenuOption(
        route: 'course',
        view: CourseView(),
        icon: Icons.book,
        name: 'Cursos'),
    MenuOption(
        route: 'bottomapp',
        view: CustomBottomAppBar(),
        icon: Icons.dashboard_customize,
        name: 'BottomAppBar'),
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (context) => HomeView(),
    'course': (context) => CourseView(),
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.view});
    }
    return appRoutes;
  }
}
