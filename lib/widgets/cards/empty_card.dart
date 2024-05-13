import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class EmptyCard extends StatelessWidget {
  final String message;
  final String title;

  const EmptyCard({super.key, required this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 240,
        width: 380,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: AppColors.primaryTextColor,
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
              Expanded(
                child: SvgPicture.asset('assets/images/undraw_no_data.svg'),
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
