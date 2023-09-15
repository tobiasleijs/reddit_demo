import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/utils/go_router.dart';

class PostFooter extends StatelessWidget {
  final int postId;
  final int commentCount;
  final int score;
  final Function upvote;
  final Function downvote;
  final bool upvoted;
  final bool downvoted;

  const PostFooter(
      {super.key,
      required this.postId,
      required this.commentCount,
      required this.score,
      required this.upvote,
      required this.downvote,
      required this.upvoted,
      required this.downvoted});

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
              color: upvoted ? const Color(0xFF499167) : const Color.fromARGB(255, 125, 125, 125),
              onPressed: () {
                upvote();
              },
            ),
            const SizedBox(width: 10.0),
            Text(
              score.toString(),
              style: const TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(255, 125, 125, 125)),
            ),
            const SizedBox(width: 10.0),
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.arrow_circle_down),
              color: downvoted ? const Color(0xFF499167) : const Color.fromARGB(255, 125, 125, 125),
              onPressed: () {
                downvote();
              },
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
              context.goNamed(RouteNames.thread,
                  pathParameters: {'post': '$postId'});
            },
          ),
          const SizedBox(width: 10.0),
          Text(
            '$commentCount',
            style: const TextStyle(
                fontSize: 24.0, color: Color.fromARGB(255, 125, 125, 125)),
          ),
        ]),
      ],
    );
  }
}
