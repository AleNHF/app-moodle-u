import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uagrm_app_moodle/models/calendar_event.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';
import 'package:uagrm_app_moodle/views/calendar/utils/assigments_widget.dart';
import '../utils/calendar_slider.dart';

class CalendarWidget extends StatefulWidget {
  final List<Event> events;

  const CalendarWidget({required this.events});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final CalendarSliderController _firstController = CalendarSliderController();
  late DateTime _selectedDateNotAppBBar;
  Random random = Random();
  List<DateTime> eventDates = [];

  @override
  void initState() {
    super.initState();
    _selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CalendarSlider(
          controller: _firstController,
          selectedDayPosition: SelectedDayPosition.center,
          backgroundColor: AppColors.bgPrimaryColor,
          locale: 'eS',
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
          events: getDateFromEvents(widget.events),
          onDateSelected: (date) {
            setState(() {
              _selectedDateNotAppBBar = date;
            });
          },
        ),
        AssigmentWidget(
            assigments: widget.events, selectedDate: _selectedDateNotAppBBar),
        ElevatedButton(
          onPressed: () {
            _firstController.goToDay(DateTime.now());
          },
          child: const Text("Ir a hoy"),
        ),
      ],
    );
  }
}

List<DateTime> getDateFromEvents(List<Event> assignments) {
  List<DateTime> dateTimeList = [];
  initializeDateFormatting('es');
  int currentYear = DateTime.now().year;

  for (final assignment in assignments) {
    // Remover etiquetas HTML y otros caracteres no deseados
    String formattedTime = assignment.formattedtime;
    RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    String result = formattedTime.replaceAll(exp, '');
    result = result.replaceAll('&amp;', '&');

    // Parsear la fecha utilizando DateFormat
    DateFormat inputFormat = DateFormat('EEEE, dd MMMM, HH:mm', 'es');
    DateTime dateTime = inputFormat.parse(result);
    dateTime = DateTime(currentYear, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute);
    DateTime parsedDateTime = dateTime;

    dateTimeList.add(parsedDateTime);
  }

  return dateTimeList;
}
