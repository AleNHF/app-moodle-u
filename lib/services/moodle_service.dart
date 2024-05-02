import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MoodleService {
  /* final String? moodleUrl = dotenv.env['MOODLE_API_URL'];
  final String? wsToken = dotenv.env['MOODLE_API_TOKEN']; */
  final String? moodleUrl = 'http://localhost/escuela-moodle/moodle/webservice/rest/server.php';
  final String? wsToken = 'c08d2527a618923757be412d964d0209';

  //TODO: Get user id from auth
  final String userId = '3';

  Future<List<dynamic>> fetchCourses() async {
    const String wsfunction = 'core_enrol_get_users_courses';
    final response = await http.post(
      Uri.parse(
          '$moodleUrl?wstoken=$wsToken&wsfunction=$wsfunction&moodlewsrestformat=json&userid=$userId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener cursos: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchAssigments() async {
    const String wsfunction = 'mod_assign_get_assignments';
    final response = await http.post(Uri.parse(
        '$moodleUrl?wstoken=$wsToken&wsfunction=$wsfunction&moodlewsrestformat=json&userid=$userId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener tareas: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchCalendarEvents() async {
    const String wsfunction = 'core_calendar_get_calendar_events';
    final response = await http.post(Uri.parse(
        '$moodleUrl?wstoken=$wsToken&wsfunction=$wsfunction&moodlewsrestformat=json&userid=$userId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener eventos del calendario: ${response.statusCode}');
    }
  }
}
