import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/posts/post_footer.dart';
import 'package:reddit_app/ui/widgets/posts/post_header.dart';

class PostExtended extends StatelessWidget {
  final String photo;
  final String subreddit;
  final String undertitle;
  final String title;
  final String description;
  final int postId;
  final int commentCount;

  const PostExtended(
      {super.key,
      required this.photo,
      required this.subreddit,
      required this.undertitle,
      required this.title,
      required this.description,
      required this.postId,
      required this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 95, 95, 95),
                      blurRadius: 4.0,
                      spreadRadius: 1,
                      offset: Offset.zero)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(
                      photo: photo, title: subreddit, undertitle: undertitle),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(description,
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(height: 10.0),
                  PostFooter(
                    postId: postId,
                    commentCount: commentCount,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
