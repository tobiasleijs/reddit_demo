import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/comments/comment.dart';
import 'package:reddit_app/ui/widgets/posts/post_extended.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';

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
              photo: 'subreddits/valo.png',
              subreddit: 'r/VALORANT',
              undertitle: 'u/FreekVonk',
              title: 'How to get to radiant asap?',
              description:
                  'Hey fellow Valorant players! I\'ve been grinding the ranks lately, and I\'m really eager to reach Radiant as soon as possible. Any tips or strategies you could share to help me climb the ladder quickly? I\'ve been working on my aim and communication, but I feel like there\'s more I can do to improve my game. Any agent recommendations or specific techniques that have worked for you in your journey to Radiant? Thanks in advance for the advice!',
            ),
            Comment(
              avatar: 'users/rutte.jpg',
              comment:
                  'To quickly climb the Valorant ranks, prioritize aim training, communicate effectively, learn map details, master multiple agents, emphasize teamwork, manage your economy wisely, watch professional gameplay for tips, and strive for consistency in your performance.',
              username: 'mrPresident',
              role: 'demissionary',
            ),
            Comment(
              avatar: 'users/trump.jpg',
              comment:
                  'Look, folks, you wouldn\'t believe the winning strategy I\'ve got for you in Valorant. Tremendous game, very tremendous. You\'ve got to aim big, okay? We\'re talking the best aim, folks, nobody aims better than me. And communication, let me tell you, nobody communicates like I do. My communication is beautiful, just beautiful. Build a team, a fantastic team, the best team, and make Valorant great again. That\'s what we\'re going to do, folks. Believe me.',
              username: 'exPOTUS',
              role: 'the_unimpeachable',
            ),
            Comment(
              avatar: 'users/tenz.png',
              comment: 'Just be me lol',
              username: 'TenZ',
              role: '#1 valorant player',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ScaffoldFooter(),
    );
  }
}
