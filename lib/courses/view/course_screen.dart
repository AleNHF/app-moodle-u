import 'package:flutter/material.dart';

import 'package:uagrm_app_moodle/courses/utils/utils.dart';


class CourseScreen extends StatelessWidget {
   
  const CourseScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Lista de cursos'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          CustomCard(imageUrl: 'https://static.vecteezy.com/system/resources/previews/003/623/626/non_2x/sunset-lake-landscape-illustration-free-vector.jpg', courseName: 'Curso Prueba 1',)
        ],
      )
    );
  }
}

