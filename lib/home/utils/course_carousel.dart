import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uagrm_app_moodle/home/models/course.dart';
import 'package:uagrm_app_moodle/utils/theme/palette_colors.dart';

class CourseCarousel extends StatelessWidget {
  final List<Course> courses;

  const CourseCarousel({required this.courses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 5,
              child: SizedBox(
                height: 100,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 250,
                      decoration: BoxDecoration(
                        color: PaletteColors.accentColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      //child: SvgPicture.network(course.courseImage),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.shortName,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: PaletteColors.primaryTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              course.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Acción al presionar el botón "Ver curso"
                                },
                                child: Text('Ver curso'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
