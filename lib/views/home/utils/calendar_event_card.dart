import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/models/calendar_event.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class CalendarEventCard extends StatelessWidget {
  final List<Event> events;

  const CalendarEventCard({required this.events});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: AppColors.primaryTextColor, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Línea de Tiempo',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              events.isNotEmpty
                  ? SizedBox(
                      height: 250,
                      child: ListView.builder(
                          itemCount: events.length,
                          itemBuilder: (context, index) {
                            final event = events[index];
                            return Padding(
                                padding: EdgeInsets.only(left: 4, right: 4),
                                child: Card(
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Icon(Icons.access_time),
                                              SizedBox(width: 4.0),
                                              Text(removeHtmlTags(
                                                  event.formattedtime)),
                                            ],
                                          ),
                                          subtitle: Text(event.activityname),
                                          trailing: Icon(Icons.chevron_right),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }))
                  : SizedBox(
                      height: 250,
                      width: 350,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: AppColors.primaryTextColor,
                              width: 0.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Línea de Tiempo',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image.asset('empty-events.jpg'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Text(
                                'No hay actividades que requieran acciones',
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ))
            ],
          ),
        ));
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    String result = htmlString.replaceAll(exp, '');
    return result.replaceAll('&amp;', '&');
  }
}
