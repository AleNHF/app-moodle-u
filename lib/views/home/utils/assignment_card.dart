import 'package:flutter/material.dart';

class AssigmentCard extends StatelessWidget {
  final String formattedtime;
  final String activityname;

  const AssigmentCard({
    super.key,
    required this.formattedtime,
    required this.activityname,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text(
                      removeHtmlTags(formattedtime),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              subtitle: Text(activityname),
              trailing:
                IconButton(
                  onPressed: () {
                    //TODO: Redireccionar a la vista de la tarea
                  }, 
                  icon: Icon(Icons.chevron_right)
                ),
            ),
          ],
        ),
      ),
    );
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    String result = htmlString.replaceAll(exp, '');
    return result.replaceAll('&amp;', '&');
  }
}
