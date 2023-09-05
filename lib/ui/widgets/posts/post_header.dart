import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String photo;
  final String title;
  final String undertitle;

  const PostHeader(
      {super.key,
      required this.photo,
      required this.title,
      required this.undertitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/$photo'),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            if (undertitle.isNotEmpty) ...[
              Text(undertitle,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 99, 99, 99), fontSize: 14)),
            ]
          ],
        ),
      ],
    );
  }
}
