import 'package:flutter/material.dart';
import 'package:reddit_app/ui/widgets/post_preview.dart';

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
      body: const PostPreview(
        photo: 'soccer.png', 
        title: 'Why Ajax will win the Europa League', 
        subreddit: 'r/soccer', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut felis eget risus lobortis maximus a eget dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas vitae urna dolor. Duis sodales dolor est, id consequat est vulputate id. Fusce sed fermentum lorem. Praesent volutpat ipsum est, et consectetur metus bibendum id. Fusce in vehicula mauris, eu gravida diam.'
        ),
    );
  }
}
