import 'package:flutter/material.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.arrow_circle_up_rounded,
              size: 40,
              color: Color.fromARGB(255, 125, 125, 125),
            ),
            SizedBox(width: 10.0),
            Text(
              '279',
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(255, 125, 125, 125)),
            ),
            SizedBox(width: 10.0),
            Icon(
              Icons.arrow_circle_down_rounded,
              size: 40,
              color: Color.fromARGB(255, 125, 125, 125),
            ),
            SizedBox(width: 40.0),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Icon(
            Icons.comment_rounded,
            size: 40.0,
            color: Color.fromARGB(255, 125, 125, 125),
          ),
          SizedBox(width: 10.0),
          Text(
            '138',
            style: TextStyle(
                fontSize: 24.0, color: Color.fromARGB(255, 125, 125, 125)),
          ),
        ]),
      ],
    );
  }
}
