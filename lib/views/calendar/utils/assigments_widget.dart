import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:uagrm_app_moodle/models/calendar_event.dart';
import 'package:uagrm_app_moodle/widgets/cards/assignment_card.dart';
import '../utils/calendar_slider.dart';

class AssigmentWidget extends StatefulWidget {
  final List<Event> assigments;
  final DateTime selectedDate;

  const AssigmentWidget({required this.assigments, required this.selectedDate});

  @override
  State<AssigmentWidget> createState() => _AssigmentWidgetState();
}

class _AssigmentWidgetState extends State<AssigmentWidget> {
  late List<Event> filteredAssigments;

  @override
  Widget build(BuildContext context) {
    filteredAssigments = widget.assigments.where((assigment) {
      final dateAssigment = getDateFromAssigment(assigment.formattedtime);
      final selectedDate = DateTime(widget.selectedDate.year,
          widget.selectedDate.month, widget.selectedDate.day);

      return dateAssigment == selectedDate;
    }).toList();

    return SizedBox(
        height: 300,
        child: filteredAssigments.isNotEmpty
            ? ListView.builder(
                itemCount: filteredAssigments.length,
                itemBuilder: (context, index) {
                  final assigment = filteredAssigments[index];

                  return Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: AssigmentCard(
                          formattedtime: assigment.formattedtime,
                          activityname: assigment.activityname));
                })
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/undraw_playful_cat.svg'),
                  Text(
                    'No tienes tareas pendientes para hoy',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ));
  }
}

DateTime getDateFromAssigment(String formattedtime) {
  initializeDateFormatting('es');
  int currentYear = DateTime.now().year;

  // Remover etiquetas HTML y otros caracteres no deseados
  RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  String result = formattedtime.replaceAll(exp, '');
  result = result.replaceAll('&amp;', '&');

  // Parsear la fecha utilizando DateFormat
  DateFormat inputFormat = DateFormat('EEEE, dd MMMM, HH:mm', 'es');
  DateTime dateTime = inputFormat.parse(result);
  dateTime = DateTime(currentYear, dateTime.month, dateTime.day);

  return dateTime;
}
