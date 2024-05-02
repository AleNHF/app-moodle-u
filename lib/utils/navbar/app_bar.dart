import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/utils/theme/palette_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onNotificationPressed;

  CustomAppBar({
    required this.title,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/16653685/pexels-photo-16653685/free-photo-of-metal-arc.jpeg'), // Cambiar por la foto del usuario logueado
            radius: 20,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(color: PaletteColors.secondaryTextColor),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: PaletteColors.secondaryTextColor,
            size: 30,
          ),
          onPressed: onNotificationPressed,
        ),
      ],
      backgroundColor: PaletteColors.optionalColor,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
