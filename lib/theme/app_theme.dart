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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: AppColors.primaryRed),
      unselectedIconTheme: IconThemeData(color: AppColors.iconColor),
      showSelectedLabels: true,
      selectedItemColor: AppColors.primaryRed
    ), 

    //TextFormField
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlue, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      floatingLabelStyle: TextStyle(color: AppColors.primaryBlue),
    ),

    //Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8.0,
        shadowColor: Colors.transparent,
        minimumSize: const Size(double.infinity, 56.0),
        backgroundColor: AppColors.primaryRed,
        disabledBackgroundColor: AppColors.primaryRed.withOpacity(0.4),
        disabledForegroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shadowColor: Colors.transparent,
        side: const BorderSide(color: AppColors.primaryRed, width: 1.5),
        minimumSize: const Size(double.infinity, 56.0),
        disabledForegroundColor: Colors.grey,
        foregroundColor: AppColors.primaryRed,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(200.0, 56.0),
        disabledForegroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    ),

    //Card
    cardTheme: CardTheme(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), 
        side: BorderSide(
          color: AppColors.primaryTextColor,
          width: 0.8,
        ),
      ),
      color: Colors.white,
    ),
  );
}