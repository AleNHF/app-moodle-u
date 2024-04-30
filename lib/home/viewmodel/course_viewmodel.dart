import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/models/course.dart';
import 'package:uagrm_app_moodle/home/services/course_service.dart';

class CourseViewModel extends ChangeNotifier {
  final CourseService _courseService = CourseService();

  List<Course> _courses = [];
  List<Course> get courses => _courses;

  Future<void> fetchCourses() async {
    try {
      final List<dynamic> jsonResponse = await _courseService.fetchCourses();

      _courses = jsonResponse.map((courseJson) {
        print('course map $courseJson');
        final course = Course(
            id: courseJson['id'],
            name: courseJson['fullname'],
            shortName: courseJson['shortname'],
            courseImage: courseJson['courseimage']);
        print('Curso mapeado: ${course.name}');
        return course;
      }).toList();

      notifyListeners();
    } catch (e) {
      // Manejar errores
      print('Error al obtener cursos: $e');
    }
  }
}
