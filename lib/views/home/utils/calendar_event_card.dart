import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/models/calendar_event.dart';
import 'package:uagrm_app_moodle/widgets/cards/assignment_card.dart';
import 'package:uagrm_app_moodle/widgets/cards/base_card.dart';

class CalendarEventCard extends StatelessWidget {
  final List<Event> events;

  const CalendarEventCard({required this.events});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

        child: BaseCard(
            title: 'Línea de Tiempo',
            child: SizedBox(
                height: 250,
                child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: AssigmentCard(
                              formattedtime: event.formattedtime,
                              activityname: event.activityname));
                    }))));
  }
}
