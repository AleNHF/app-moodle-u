import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';
import '../utils/calendar_slider.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final CalendarSliderController _firstController = CalendarSliderController();
  final CalendarSliderController _secondController = CalendarSliderController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarSlider(
          controller: _secondController,
          selectedDayPosition: SelectedDayPosition.center,
          backgroundColor: AppColors.bgPrimaryColor,
          locale: 'en',
          selectedDateColor: AppColors.bgPrimaryColor,
          selectedTileBackgroundColor: AppColors.primaryRed,
          monthYearButtonBackgroundColor: Colors.white,
          monthYearTextColor: AppColors.secondaryTextColor,
          tileBackgroundColor: AppColors.primaryBlue,
          dateColor: AppColors.bgPrimaryColor,
          tileShadow: BoxShadow(
            color: Colors.black.withOpacity(1),
          ),
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 140)),
          lastDate: DateTime.now().add(const Duration(days: 400)),
          events: List.generate(
              100,
              (index) => DateTime.now()
                  .subtract(Duration(days: index * random.nextInt(5)))),
          onDateSelected: (date) {
            setState(() {
              _selectedDateNotAppBBar = date;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            _secondController.goToDay(DateTime.now());
          },
          child: const Text("Go to today"),
        ),
        Text('Selected date is $_selectedDateNotAppBBar'),
      ],
    );
  }
}
