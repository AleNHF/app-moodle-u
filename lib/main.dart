import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/courses/view/course_screen.dart';
import 'package:uagrm_app_moodle/courses/viewmodel/course_viewmodel.dart';
import 'package:uagrm_app_moodle/utils/navbar/app_bar.dart';

void main() async {
  // await dotenv.load(fileName: '.env');
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => CourseViewModel(), lazy: false ),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: CustomAppBar(
          title: 'User Name',
          onNotificationPressed: () {
            
          },),
          body: CourseScreen()
          // body: HomeView()
      ),
    );
  }
}
