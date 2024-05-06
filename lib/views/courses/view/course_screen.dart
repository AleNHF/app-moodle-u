import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uagrm_app_moodle/views/courses/utils/utils.dart';
import 'package:uagrm_app_moodle/viewmodels/course_viewmodel.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseViewModel = context.watch<CourseViewModel>();
    final courses = courseViewModel.courses;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final course in courses)
          CustomCard(
            imageUrl: course.courseimage,
            courseName: course.fullname,
          ),
      ],
    );
  }
}
