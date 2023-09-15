import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/posts/post_header.dart';

class Comment extends StatelessWidget {
  final String username;
  final String avatar;
  final String comment;
  final String role;
  final int score;
  final bool upvoted;
  final bool downvoted;
  final Function upvoteComment;
  final Function downvoteComment;

  const Comment({
    super.key,
    required this.username,
    required this.avatar,
    required this.comment,
    required this.role,
    required this.score,
    required this.upvoted,
    required this.downvoted,
    required this.downvoteComment,
    required this.upvoteComment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 95, 95, 95),
              blurRadius: 4.0,
              spreadRadius: 1,
              offset: Offset.zero)
        ],
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(
            photo: avatar,
            title: username,
            undertitle: role,
          ),
          const SizedBox(height: 10.0),
          Text(
            comment,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_circle_up_rounded,
                    size: 30, color: upvoted ? const Color(0xFF499167) : const Color.fromARGB(255, 125, 125, 125)),
                onPressed: () {
                  upvoteComment();
                },
              ),
              const SizedBox(width: 10.0),
              Text(
                score.toString(),
                style: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 125, 125, 125)),
              ),
              const SizedBox(width: 10.0),
              IconButton(
                icon: Icon(Icons.arrow_circle_down_rounded,
                    size: 30, color: downvoted ? const Color(0xFF499167) : const Color.fromARGB(255, 125, 125, 125)),
                onPressed: () {
                  downvoteComment();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
