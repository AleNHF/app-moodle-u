import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uagrm_app_moodle/home/viewmodel/home_viewmodel.dart';

class CalendarEventCard extends StatelessWidget {
  final HomeViewModel viewModel;

  const CalendarEventCard({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.calendarEvents.length,
            itemBuilder: (context, index) {
              final event = viewModel.calendarEvents[index];
              return Card(
                child: ListTile(
                  title: Text(event.name),
                  subtitle: Text(event.timeStart),
                  trailing: Text(event.description),
                ),
              );
            },
          );
        }
      ),
    );
  }
}