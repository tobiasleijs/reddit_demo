import 'package:flutter/material.dart';
import 'package:reddit_app/persistence/DTO/comment_dto.dart';
import 'package:reddit_app/persistence/DTO/post_dto.dart';
import 'package:reddit_app/persistence/DTO/user_dto.dart';
import 'package:reddit_app/persistence/DTO/subreddit_dto.dart';
import 'package:reddit_app/persistence/persistence_adapter.dart';
import 'package:reddit_app/persistence/persistence_port.dart';
import 'package:reddit_app/ui/widgets/comments/comment.dart';
import 'package:reddit_app/ui/widgets/posts/post_extended.dart';
import 'package:reddit_app/ui/widgets/scaffold/footer.dart';

class Thread extends StatefulWidget {
  final int post;

  const Thread({super.key, required this.post});

  @override
  // ignore: no_logic_in_create_state
  State<Thread> createState() => _ThreadState(post);
}

class _ThreadState extends State<Thread> {
  final int post;
  PersistencePort database = PersistenceAdapter();
  late SubredditDTO subredditDTO;
  late PostDTO postDTO;
  late UserDTO poster;

  _ThreadState(this.post) {
    postDTO = database.getPostFromId(post);
    subredditDTO = database.getSubreddit(postDTO.subreddit);
    poster = database.getUserFromId(postDTO.authorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76F7BF),
      appBar: AppBar(
        title: Text(subredditDTO.name),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 61, 61),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostExtended(
              photo: subredditDTO.image,
              subreddit: subredditDTO.name,
              undertitle: poster.title,
              title: postDTO.title,
              description: postDTO.body,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: database.getCommentsForPost(post).length,
                itemBuilder: (context, index) {
                  List<CommentDTO> comments = database.getCommentsForPost(post);
                  UserDTO commenter =
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
