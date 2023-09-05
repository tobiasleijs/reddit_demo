import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/posts/post_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Reddit Home'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PostPreview(
                photo: 'subreddits/soccer.png',
                title: 'Why Ajax will win the Europa League',
                subreddit: 'r/soccer',
                description:
                    'Ajax has all the ingredients to emerge victorious in the Europa League this season. With their relentless attacking prowess, skillful midfielders, and a solid defense, they\'ve shown an unwavering determination to claim the title. Under the astute guidance of their coach, their tactical acumen and ability to adapt to different opponents have been impressive. Furthermore, their rich history and experience in European competitions give them the edge, and their young talents continue to shine on the international stage. With a perfect blend of youth and experience, Ajax is poised to conquer the Europa League and add another prestigious trophy to their illustrious legacy.'),
            PostPreview(
                photo: 'subreddits/valo.png',
                title: 'How to get to radiant asap?',
                subreddit: 'r/VALORANT',
                description:
                    'Hey fellow Valorant players! I\'ve been grinding the ranks lately, and I\'m really eager to reach Radiant as soon as possible. Any tips or strategies you could share to help me climb the ladder quickly? I\'ve been working on my aim and communication, but I feel like there\'s more I can do to improve my game. Any agent recommendations or specific techniques that have worked for you in your journey to Radiant? Thanks in advance for the advice!'),
            PostPreview(
                photo: 'subreddits/f1.png',
                title:
                    'How Max Verstappen got the record for most consecutive grand prix wins',
                subreddit: 'r/formula1',
                description:
                    'Max Verstappen secured the record for the most consecutive Grand Prix wins by delivering a remarkable performance in the 2023 Formula 1 season. Driving for Red Bull Racing, he achieved a total of nine consecutive wins from the Miami Grand Prix in May to the Dutch Grand Prix in August. Verstappen\'s success was attributed to his exceptional driving skills, the competitiveness of the Red Bull car, and strategic team decisions that optimized his race performances during this impressive streak, solidifying his reputation as one of the sport\'s most formidable talents.'),
          ],
        ),
      ),
    );
  }
}
