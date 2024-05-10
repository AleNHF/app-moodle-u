import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/viewmodels/calendar_event_viewmodel.dart';
import 'package:uagrm_app_moodle/views/calendar/utils/assigments_list.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late final CalendarEventViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CalendarEventViewModel();
    viewModel.fetchCalendarEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssigmentList(viewModel: viewModel)
      ],
    );
  }

    @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
