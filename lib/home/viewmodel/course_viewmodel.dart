import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/home/models/course.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class CourseViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<Course> _courses = [];
  List<Course> get courses => _courses;

  Future<void> fetchCourses() async {
    try {
      final List<dynamic> jsonResponse = await _moodleService.fetchCourses();

      _courses = jsonResponse.map((courseJson) {
        final course = Course(
            id: courseJson['id'],
            name: courseJson['fullname'],
            shortName: courseJson['shortname'],
            courseImage: courseJson['courseimage']);

        print('COURSE ${course.courseImage}');

        return course;
      }).toList();

      notifyListeners();
    } catch (e) {
      // Manejar errores
      print('Error al obtener cursos: $e');
    }
  }
}
