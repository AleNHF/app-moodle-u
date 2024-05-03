import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uagrm_app_moodle/courses/models/course.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class CourseViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();

  List<Course> _courses = [];
  List<Course> get courses => _courses;

  Future<void> fetchCourses() async {
    try {
      final List<dynamic> jsonResponse = await _moodleService.fetchCourses();
      _courses = jsonResponse.map((json) => Course.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      print('Error al obtener cursos: $e');
    }
  }
}
