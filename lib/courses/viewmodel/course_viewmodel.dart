import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uagrm_app_moodle/courses/models/course.dart';

class CourseViewModel extends ChangeNotifier {
  String _baseUrl = 'http://localhost/moodle/webservice/rest/server.php';
  String _wsToken = '6b769994195a4c0d1a7df20149aa3fbd';
  String _userId = '5';
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  CourseViewModel() {
    getCourses();
  }

  Future<void> getCourses() async {
    var url = Uri.https(_baseUrl, '', {
      'wstoken': _wsToken, 
      'moodlewsrestformat': 'json', 
      'wsfunction': 'core_enrol_get_users_courses', 
      'userid': _userId
    });
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parseamos la respuesta como una lista de objetos Course
      List<Course> courses = (json.decode(response.body) as List).map((data) => Course.fromJson(data)).toList();

      // Asignamos la lista de cursos a _courses y notificamos a los listeners
      _courses = courses;
      print(_courses);
      notifyListeners();
    } else {
      // Manejo de errores
      print('Error al obtener cursos: ${response.statusCode}');
    }
  }
}