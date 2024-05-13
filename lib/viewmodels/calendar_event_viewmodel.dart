import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/models/calendar_event.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class CalendarEventViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<Event> _calendarEvents = [];
  bool _isLoading = false;

  List<Event> get calendarEvents => _calendarEvents;
  bool get isLoading => _isLoading;

  CalendarEventViewModel() {
    fetchCalendarEvents();
  }

  Future<void> fetchCalendarEvents() async {
    try {
      _isLoading = true;
      final List<dynamic> jsonResponse =
          await _moodleService.fetchCalendarEvents();

      _calendarEvents = jsonResponse.map((json) => Event.fromJson(json)).toList();
    } catch (e) {
      print('Error al obtener eventos: $e');
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}
