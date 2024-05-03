import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';
import 'package:uagrm_app_moodle/theme/app_theme.dart';

class CustomBottomAppBar extends StatelessWidget {
  int _selectedTab = 0;

  c

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: "Calendario"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined), label: "Notificaciones"),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Menú")
      ]
    );
  }
}
