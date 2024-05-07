import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/models/course.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class CourseViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<Course> _courses = [];
  bool _isLoading = false;

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  
  CourseViewModel(){
    print('Entra courseviewmodel');
    fetchCourses();
  }
  
  Future<void> fetchCourses() async {
    try {
      _isLoading = true;
      final List<dynamic> jsonResponse = await _moodleService.fetchCourses();
      print('jsonResponse CourseViewModel: ${jsonResponse}');
      
      _courses = jsonResponse.map((json) => Course.fromJson(json)).toList();   
      print('_course: $_courses');
    } catch (e) {
      print('Error al obtener cursos from view model: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
