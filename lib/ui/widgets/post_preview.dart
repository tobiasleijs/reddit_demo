import 'package:flutter/material.dart';

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
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/$photo'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    subreddit,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
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
              const Row(
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
                            fontSize: 24.0,
                            color: Color.fromARGB(255, 125, 125, 125)),
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
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 125, 125, 125)),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
