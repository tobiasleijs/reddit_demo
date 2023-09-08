import 'package:flutter/material.dart';
import 'package:reddit_app/persistence/models/comment_model.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/widgets/posts/post_preview.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistencePort database = PersistenceAdapter();
  late List<PostModel> posts;
  _HomePageState() {
    posts = database.getPosts();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  PostModel post = posts[index];
                  return PostPreview(
                    photo: database.getSubreddit(post.subreddit).image,
                    title: post.title,
                    subreddit: post.subreddit,
                    description: post.body,
                    postId: post.id,
                    commentCount: database.getCommentsForPost(post.id).length
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: const ScaffoldFooter(),
    );
  }
}
