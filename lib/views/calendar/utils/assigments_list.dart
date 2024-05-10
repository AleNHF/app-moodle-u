import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/views/calendar/utils/calendar_widget.dart';
import 'package:uagrm_app_moodle/viewmodels/calendar_event_viewmodel.dart';

class AssigmentList extends StatelessWidget {
  final CalendarEventViewModel viewModel;

  const AssigmentList({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CalendarEventViewModel>(
        builder: (context, viewModel, child) {
          final events = viewModel.calendarEvents;
          final isLoading = viewModel.isLoading;

          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 

          return CalendarWidget(events: events);
        },
      ),
    );
  }
}
