import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/view/home_view.dart';
import 'package:uagrm_app_moodle/utils/navbar/app_bar.dart';

void main() async {
  //await dotenv.load(fileName: '.env');
  runApp(MyApp());
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
          body: HomeView()
      ),
    );
  }
}
