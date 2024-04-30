// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/utils/course_list.dart';
import 'package:uagrm_app_moodle/home/viewmodel/course_viewmodel.dart';
import 'package:uagrm_app_moodle/utils/theme/palette_colors.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CourseViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CourseViewModel();
    viewModel.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16), //EdgeInsets.all(16.0),
            child: Text(
              'Mis cursos',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: PaletteColors.secondaryTextColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: CourseList(viewModel: viewModel),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
