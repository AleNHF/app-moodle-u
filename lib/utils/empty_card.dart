import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class EmptyCard extends StatelessWidget {
  final String message;

  const EmptyCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: 350,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: AppColors.primaryTextColor, width: 0.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset('empty-events.jpg'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
