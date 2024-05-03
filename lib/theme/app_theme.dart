import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class AppTheme {
  static const Color primary = Colors.blue;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: AppColors.primaryBlue,

    // AppBar Theme 
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryBlue,
      elevation: 2,
      shadowColor: Colors.transparent,
      centerTitle: false,
      scrolledUnderElevation: 10,
      toolbarHeight: 80,
      titleTextStyle: TextStyle(
        color: AppColors.bgPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      )
    ),

    //Bottom Navigation Bar Theme
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.bgSecondaryColor,
      shadowColor: Colors.transparent,
      shape: CircularNotchedRectangle(),
      height: 80
    ),

    // agregar los estilos de los demas widget
    

  );
}