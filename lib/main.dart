import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/views/calendar/view/calendar_view.dart';
import 'package:uagrm_app_moodle/views/courses/view/course_view.dart';
import 'package:uagrm_app_moodle/views/home/view/home_view.dart';

import 'package:uagrm_app_moodle/viewmodels/course_viewmodel.dart';
import 'package:uagrm_app_moodle/router/app_routes.dart';
import 'package:uagrm_app_moodle/theme/app_theme.dart';

void main() async {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseViewModel(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UAGRM - Virtual',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _screens = <Widget>[
    HomeView(),
    CourseView(),
    CalendarView()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Cursos'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendario')
        ],
      ),
    );
  }
}
