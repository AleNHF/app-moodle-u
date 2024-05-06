import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/models/course.dart';
import 'package:uagrm_app_moodle/utils/base_card.dart';
import 'package:uagrm_app_moodle/views/home/utils/course_card.dart';
import 'package:uagrm_app_moodle/utils/empty_card.dart';

class CourseCarousel extends StatelessWidget {
  final List<Course> courses;

  const CourseCarousel({required this.courses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 240,
        child: BaseCard(
            title: 'Mis Cursos',
            child: courses.isNotEmpty
                ? SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: CourseCard(
                                courseimage: course.courseimage,
                                shortname: course.shortname,
                                fullname: course.fullname));
                      },
                    ),
                  )
                : EmptyCard(message: 'No estás matriculado en ningún curso.')));
  }
}
