import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/utils/go_router.dart';

class PostFooter extends StatelessWidget {
  final postId;
  const PostFooter({super.key, this.postId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.arrow_circle_up),
              color: const Color.fromARGB(255, 125, 125, 125),
              onPressed: () {},
            ),
            const SizedBox(width: 10.0),
            const Text(
              '279',
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(255, 125, 125, 125)),
            ),
            const SizedBox(width: 10.0),
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.arrow_circle_down),
              color: const Color.fromARGB(255, 125, 125, 125),
              onPressed: () {},
            ),
            const SizedBox(width: 40.0),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
            iconSize: 40,
            icon: const Icon(Icons.comment_rounded),
            color: const Color.fromARGB(255, 125, 125, 125),
            onPressed: () {
              context.goNamed(RouteNames.thread, pathParameters: {'post': '$postId'});
            },
          ),
          const SizedBox(width: 10.0),
          const Text(
            '138',
            style: TextStyle(
                fontSize: 24.0, color: Color.fromARGB(255, 125, 125, 125)),
          ),
        ]),
      ],
    );
  }
}
