import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uagrm_app_moodle/courses/utils/utils.dart';
import 'package:uagrm_app_moodle/courses/viewmodel/course_viewmodel.dart';


class CourseScreen extends StatelessWidget {
   
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseViewModel = context.watch<CourseViewModel>();
    final courses = courseViewModel.courses;

    return  Scaffold(
      /* appBar: AppBar(
        title: Text('Lista de cursos'),
      ), */
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CustomCard(
            imageUrl: course.courseimage,
            courseName: course.fullname,
          );
        },
      ),
    );
  }
}

