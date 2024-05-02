// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/utils/calendar_event_card.dart';
import 'package:uagrm_app_moodle/home/utils/course_list.dart';
import 'package:uagrm_app_moodle/home/viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel viewModelCourse, viewModelEvent;

  @override
  void initState() {
    super.initState();
    viewModelCourse = viewModelEvent = HomeViewModel();

    viewModelCourse.fetchCourses();
    viewModelEvent.fetchCalendarEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: CourseList(viewModel: viewModelCourse),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: CalendarEventCard(viewModel: viewModelCourse),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    viewModelCourse.dispose();
    viewModelEvent.dispose();
    super.dispose();
  }
}
