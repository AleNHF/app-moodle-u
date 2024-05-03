import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/courses/view/course_screen.dart';
import 'package:uagrm_app_moodle/courses/viewmodel/course_viewmodel.dart';
import 'package:uagrm_app_moodle/router/app_routes.dart';
import 'package:uagrm_app_moodle/theme/app_theme.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:uagrm_app_moodle/home/view/home_view.dart';
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
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
