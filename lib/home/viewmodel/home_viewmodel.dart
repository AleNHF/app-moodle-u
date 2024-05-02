import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/models/calendar_event.dart';
import 'package:uagrm_app_moodle/home/models/course.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class HomeViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<Course> _courses = [];
  List<Course> get courses => _courses;

  List<CalendarEvent> _calendarEvents = [];
  List<CalendarEvent> get calendarEvents => _calendarEvents;

  Future<void> fetchCourses() async {
    try {
      final List<dynamic> jsonResponse = await _moodleService.fetchCourses();

      _courses = jsonResponse.map((courseJson) {
        final course = Course(
            id: courseJson['id'],
            name: courseJson['fullname'],
            shortName: courseJson['shortname'],
            courseImage: courseJson['courseimage']);

        return course;
      }).toList();

      notifyListeners();
    } catch (e) {
      // Manejar errores
      print('Error al obtener cursos: $e');
    }
  }

  Future<void> fetchCalendarEvents() async {
    try {
      final List<dynamic> jsonResponse =
          await _moodleService.fetchCalendarEvents();

      _calendarEvents = jsonResponse.map((calendarEventJson) {
        final calendarEvent = CalendarEvent(
            id: calendarEventJson['id'],
            name: calendarEventJson['name'],
            description: calendarEventJson['description'],
            timeStart: calendarEventJson['timeStart']);

        return calendarEvent;
      }).toList();

      notifyListeners();
    } catch (e) {
      // Manejar errores
      print('Error al obtener eventos: $e');
    }
  }
}
