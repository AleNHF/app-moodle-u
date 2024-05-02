import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.blue;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: primary,

    // AppBar Theme 
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),

    // agregar los estilos de los demas widget
    

  );


}