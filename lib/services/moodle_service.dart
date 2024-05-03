import 'dart:convert';
import 'package:http/http.dart' as http;

class MoodleService {
  /* final String? moodleUrl = dotenv.env['MOODLE_API_URL'];
  final String? wsToken = dotenv.env['MOODLE_API_TOKEN']; */
  final String? moodleUrl = 'http://localhost/moodle/webservice/rest/server.php';
  final String? wsToken = '6b769994195a4c0d1a7df20149aa3fbd';

  //TODO: Get user id from auth
  final String userId = '2';

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
    const String wsfunction = 'core_calendar_get_action_events_by_timesort';
    final response = await http.post(Uri.parse(
        '$moodleUrl?wstoken=$wsToken&wsfunction=$wsfunction&moodlewsrestformat=json&userid=$userId'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['events'];
    } else {
      throw Exception('Error al obtener eventos del calendario: ${response.statusCode}');
    }
  }
}