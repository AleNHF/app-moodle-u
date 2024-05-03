import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/home/utils/calendar_event_card.dart';
import 'package:uagrm_app_moodle/home/viewmodel/calendar_event_viewmodel.dart';

class CalendarEventList extends StatelessWidget {
  final CalendarEventViewModel viewModel;

  const CalendarEventList({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CalendarEventViewModel>(
        builder: (context, viewModel, child) {
          final events = viewModel.calendarEvents;

          if (events.isEmpty) {
            return  Center(child: CircularProgressIndicator());
          }

          return CalendarEventCard(events: events);
        },
      ),
    );
  }
}
