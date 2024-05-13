import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/widgets/cards/empty_card.dart';
import 'package:uagrm_app_moodle/views/home/utils/calendar_event_card.dart';
import 'package:uagrm_app_moodle/viewmodels/calendar_event_viewmodel.dart';

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
          final isLoading = viewModel.isLoading;

          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (events.isEmpty) { 
            return EmptyCard(
              message: 'Ninguna actividad requiere acciones necesarias',
              title: 'Línea de Tiempo',
            );
          }

          return CalendarEventCard(events: events);
        },
      ),
    );
  }
}
