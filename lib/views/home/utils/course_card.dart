import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class CourseCard extends StatelessWidget {
  final String courseimage;
  final String shortname;
  final String fullname;

  const CourseCard({
    super.key,
    required this.courseimage,
    required this.shortname,
    required this.fullname
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Redireccionar a vista de un curso
      },
      child: Card(
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
                  width: 280,
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: SvgPicture.network(courseimage),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shortname,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          fullname,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
