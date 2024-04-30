import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/home/utils/course_carousel.dart';
import 'package:uagrm_app_moodle/home/viewmodel/course_viewmodel.dart';

class CourseList extends StatelessWidget {
  final CourseViewModel viewModel;

  const CourseList({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CourseViewModel>(
        builder: (context, viewModel, child) {
          final courses = viewModel.courses;
          print('COURSES LIST ${courses}');

          if (courses.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return CourseCarousel(courses: courses);
        },
      ),
    );
  }
}