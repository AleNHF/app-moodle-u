import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final String imageUrl;
  final String courseName;

  const CustomCard({
    super.key, 
    required this.imageUrl, 
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Center(
              child: Text(
                courseName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}