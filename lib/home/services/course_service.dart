import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseService {
  final String moodleUrl = 'http://localhost/escuela-moodle/moodle/webservice/rest/server.php';
  final String wsToken = 'c08d2527a618923757be412d964d0209';
  final String userId = '3'; 

  Future<List<dynamic>> fetchCourses() async {
    final response = await http.post(
      Uri.parse('$moodleUrl/webservice/rest/server.php?wstoken=$wsToken&wsfunction=core_enrol_get_users_courses&moodlewsrestformat=json&userid=$userId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener cursos: ${response.statusCode}');
    }
  }
}
