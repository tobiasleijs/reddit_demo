import 'package:flutter/material.dart';
import 'package:reddit_app/persistence/models/comment_model.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/models/user_model.dart';
import 'package:reddit_app/persistence/models/subreddit_model.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/widgets/comments/comment.dart';
import 'package:reddit_app/ui/widgets/posts/post_extended.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';

class Thread extends StatefulWidget {
  final int post;

  const Thread({super.key, required this.post});

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  PersistencePort database = PersistenceAdapter();
  late SubredditModel subredditModel;
  late PostModel postModel;
  late UserModel poster;
  late int postid = widget.post;

  @override
  void initState() {
    postModel = database.getPostFromId(widget.post);
    subredditModel = database.getSubreddit(postModel.subreddit);
    poster = database.getUserFromId(postModel.authorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76F7BF),
      appBar: AppBar(
        title: Text(subredditModel.name),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 61, 61),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostExtended(
              photo: subredditModel.image,
              subreddit: subredditModel.name,
              undertitle: poster.title,
              title: postModel.title,
              description: postModel.body,
              postId: widget.post,
              commentCount: database.getCommentsForPost(widget.post).length,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: database.getCommentsForPost(widget.post).length,
                itemBuilder: (context, index) {
                  List<CommentModel> comments =
                      database.getCommentsForPost(widget.post);
                  UserModel commenter =
                      database.getUserFromId(comments[index].commenterId);
                  return Comment(
                      avatar: commenter.avatar,
                      comment: comments[index].comment,
                      role: commenter.title,
                      username: commenter.username);
                })
          ],
        ),
      ),
      bottomNavigationBar: const ScaffoldFooter(),
    );
  }
}
