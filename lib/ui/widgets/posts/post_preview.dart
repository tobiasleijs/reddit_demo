import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/posts/post_footer.dart';
import 'package:reddit_app/ui/widgets/posts/post_header.dart';

class PostPreview extends StatelessWidget {
  final String photo;
  final String title;
  final String subreddit;
  final String description;

  const PostPreview(
      {super.key,
      required this.photo,
      required this.title,
      required this.subreddit,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PostHeader(photo: photo, title: subreddit, undertitle: ''),
              const SizedBox(height: 12.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color.fromARGB(255, 125, 125, 125),
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 10.0),
              const PostFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
