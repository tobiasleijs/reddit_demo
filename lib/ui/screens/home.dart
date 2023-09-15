import 'package:flutter/material.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/widgets/posts/post_preview.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';
import 'package:reddit_app/utils/user_simple_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistencePort database = PersistenceAdapter();
  late List<PostModel> posts;
  late int loggedInUser = UserSimplePreferences.getLoggedInUser();
  _HomePageState() {
    posts = database.getPosts();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76F7BF),
      appBar: AppBar(
        title: const Text('Reddit Home'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 61, 61),
      ),
      body: ListView(children: [
        for (PostModel post in posts) ...[
          PostPreview(
            photo: database.getSubreddit(post.subreddit).image,
            title: post.title,
            subreddit: post.subreddit,
            description: post.body,
            postId: post.id,
            commentCount: database.getCommentsForPost(post.id).length,
            score: database.getUpvoteScore(post.id),
            upvoted: database.getUpvotedForUser(loggedInUser, post.id),
            downvoted: database.getDownvotedForUser(loggedInUser, post.id),
            upvote: () {
              setState(() {
                database.upvotePost(post.id, loggedInUser);
              });
            },
            downvote: () {
              setState(() {
                database.downvotePost(post.id, loggedInUser);
              });
            },
          ),
        ]
      ]),
      bottomNavigationBar: const ScaffoldFooter(),
    );
  }
}
