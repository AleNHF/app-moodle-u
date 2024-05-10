import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/widgets/empty_card.dart';
import 'package:uagrm_app_moodle/views/home/utils/course_carousel.dart';
import 'package:uagrm_app_moodle/viewmodels/course_viewmodel.dart';

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
          final isLoading = viewModel.isLoading;

          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (courses.isEmpty) {
            return EmptyCard(
              message: 'No estás matriculado en ningún curso',
              title: 'Mis Cursos',
            );
          }

          return CourseCarousel(courses: courses);
        },
      ),
    );
  }
}
