import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/models/calendar_event.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class CalendarEventViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<Event> _calendarEvents = [];
  List<Event> get calendarEvents => _calendarEvents;

  CalendarEventViewModel() {
    fetchCalendarEvents();
  }

  Future<void> fetchCalendarEvents() async {
    try {
      final List<dynamic> jsonResponse =
          await _moodleService.fetchCalendarEvents();

      _calendarEvents = jsonResponse.map((json) => Event.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      print('Error al obtener eventos: $e');
    }
  }
}
