import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/models/calendar_event.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class CalendarEventViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<CalendarEvent> _calendarEvents = [];
  List<CalendarEvent> get calendarEvents => _calendarEvents;

  Future<void> fetchCalendarEvents() async {
    try {
      final List<dynamic> jsonResponse =
          await _moodleService.fetchCalendarEvents();

      _calendarEvents = jsonResponse.map((calendarEventJson) {
        final calendarEvent = CalendarEvent(
            id: calendarEventJson['id'],
            name: calendarEventJson['name'],
            description: calendarEventJson['description'],
            formattedTime: calendarEventJson['formattedtime'],
            activityName: calendarEventJson['activityname']);

        return calendarEvent;
      }).toList();

      notifyListeners();
    } catch (e) {
      // Manejar errores
      print('Error al obtener eventos: $e');
    }
  }
}
