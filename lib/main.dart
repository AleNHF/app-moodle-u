import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uagrm_app_moodle/theme/app_theme.dart';
import 'package:uagrm_app_moodle/courses/view/course_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(), lazy: false,
      child: MaterialApp(
        title: 'Namer App',
        // theme: ThemeData(
        //   useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        // ),
        theme: AppTheme.lightTheme,
        // home: MyHomePage(),
        home: CourseScreen(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea test:'),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}
