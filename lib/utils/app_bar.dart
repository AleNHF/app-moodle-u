import 'package:flutter/material.dart';
import 'package:uagrm_app_moodle/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/16653685/pexels-photo-16653685/free-photo-of-metal-arc.jpeg'), // Cambiar por la foto del usuario logueado
            radius: 20,
          ),
          SizedBox(width: 20),
          Text(
            title,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: AppColors.bgPrimaryColor,
                size: 30,
              ),
              onPressed: () {}),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
