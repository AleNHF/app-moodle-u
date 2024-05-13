// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';
import 'package:uagrm_app_moodle/views/home/utils/calendar_event_list.dart';
import 'package:uagrm_app_moodle/views/home/utils/course_list.dart';
import 'package:uagrm_app_moodle/viewmodels/calendar_event_viewmodel.dart';
import 'package:uagrm_app_moodle/viewmodels/course_viewmodel.dart';
import 'package:uagrm_app_moodle/widgets/navbar/app_bar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CourseViewModel viewModelCourse;
  late final CalendarEventViewModel viewModelEvent;

  @override
  void initState() {
    super.initState();
    viewModelCourse = CourseViewModel();
    viewModelEvent = CalendarEventViewModel();

    viewModelCourse.fetchCourses();
    viewModelEvent.fetchCalendarEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'UAGRM - Virtual'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: SizedBox(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Calendario',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarView()));
                              Navigator.pushNamed(context, 'calendar');
                            }, 
                            icon: Icon(Icons.chevron_right)),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(8),
              child: CourseList(viewModel: viewModelCourse),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: CalendarEventList(viewModel: viewModelEvent),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    viewModelCourse.dispose();
    viewModelEvent.dispose();
    super.dispose();
  }
}
