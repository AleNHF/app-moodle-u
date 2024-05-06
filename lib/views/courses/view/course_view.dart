import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uagrm_app_moodle/views/courses/utils/custom_card.dart';
import 'package:uagrm_app_moodle/viewmodels/course_viewmodel.dart';


class CourseView extends StatelessWidget {
   
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseViewModel = context.watch<CourseViewModel>();
    final courses = courseViewModel.courses;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final course in courses)
          CustomCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThlzezOKuzEzpC89otwMZcgFKcHJc31JiWsmR5gmczWQ&s',
            courseName: course.fullname,
          ),
      ],
    );

    // return SizedBox(
    //   width: double.infinity,
    //   height: size.height * 0.4,
    //   child: ListView.builder(
    //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //     itemCount: courses.length,
    //     itemBuilder: (context, index) {
    //       final course = courses[index];
    //       return CustomCard(
    //         imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThlzezOKuzEzpC89otwMZcgFKcHJc31JiWsmR5gmczWQ&s',
    //         courseName: course.fullname,
    //       );
    //     },
    //   ),
    // );
  }
}
