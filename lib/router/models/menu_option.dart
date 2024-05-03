import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  final String route;
  final Widget view;
  final IconData icon;

  MenuOption({
    required this.route, 
    required this.view,
    required this.icon, 
  });
}