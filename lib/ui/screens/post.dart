import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/posts/post_extended.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  String subreddit = 'r/VALORANT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(subreddit),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PostExtended(
              photo: 'valo.png',
              subreddit: 'r/VALORANT',
              undertitle: 'u/FreekVonk',
              title: 'How to get to radiant asap?',
              description:
                  'Hey fellow Valorant players! I\'ve been grinding the ranks lately, and I\'m really eager to reach Radiant as soon as possible. Any tips or strategies you could share to help me climb the ladder quickly? I\'ve been working on my aim and communication, but I feel like there\'s more I can do to improve my game. Any agent recommendations or specific techniques that have worked for you in your journey to Radiant? Thanks in advance for the advice!',
            ),
          ],
        ),
      ),
    );
  }
}
