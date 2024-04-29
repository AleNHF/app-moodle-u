// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget {
  final String title;
  AnimationController colorAnimationController;
  Animation colorTween, homeTween, workOutTween, iconTween, drawerTween;
  Function onPressed;

  GlobalAppBar(
      {Key? key,
      required this.title,
      required this.colorAnimationController,
      required this.onPressed,
      required this.homeTween,
      required this.colorTween,
      required this.iconTween,
      required this.drawerTween,
      required this.workOutTween})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => AppBar(
          leading: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
          backgroundColor: colorTween.value,
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(
            children: <Widget>[
              Text(
                "Hello  ",
                style: TextStyle(
                    color: homeTween.value,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
              Text(
                'username',
                style: TextStyle(
                    color: workOutTween.value,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
            ],
          ),
          actions: <Widget>[
            Icon(
              Icons.notifications,
              color: iconTween.value,
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: CircleAvatar(
                backgroundImage: NetworkImage('image_url'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
