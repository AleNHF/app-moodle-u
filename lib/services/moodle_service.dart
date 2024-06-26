import 'dart:convert';
import 'package:http/http.dart' as http;

class MoodleService {
  //final String? moodleUrl = 'http://192.168.1.216/moodle/webservice/rest/server.php';
  //final String? wsToken = '2e36c0e5b3413dad7c7d67e084aa3c1c';
  final String? moodleUrl = 'http://192.168.0.13/moodle/webservice/rest/server.php';
  final String? wsToken = 'b89005ce3c945c9a3ecc0109a974b30f';

  //TODO: Get user id from auth
  final String userId = '4';

  Future<List<dynamic>> fetchCourses() async {
    const String wsfunction = 'core_enrol_get_users_courses';
    final url = Uri.parse(
      '$moodleUrl?wstoken=$wsToken&wsfunction=$wsfunction&moodlewsrestformat=json&userid=$userId',
    );

    final response = await http.post(url);

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

  Future<Map<String, dynamic>> authenticate(String username, String password, String service) async {
    final loginUrl = Uri.parse('http://192.168.1.5/moodle/login/token.php');
    final response = await http.post(loginUrl, body: {
      'username': username,
      'password': password,
      'service': service,
    });

    if (response.statusCode == 200) {
      final authTokenResponse = jsonDecode(response.body);

      if (authTokenResponse.containsKey('token')) {
        return authTokenResponse;
      } else {
        throw Exception(authTokenResponse['error']);
      }
    } else {
      throw Exception('Error de autenticación: ${response.statusCode}');
    }
  }
}
