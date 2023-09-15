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
import 'package:reddit_app/utils/user_simple_preferences.dart';

class Thread extends StatefulWidget {
  final int post;

  const Thread({super.key, required this.post});

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  final _formKey = GlobalKey<FormState>();
  PersistencePort database = PersistenceAdapter();
  late SubredditModel subredditModel;
  late PostModel postModel;
  late UserModel poster;
  late int postid = widget.post;
  final TextEditingController textEditingController = TextEditingController();
  final scrollController = ScrollController();
  late int loggedInUser;

  late String comment;

  @override
  void initState() {
    postModel = database.getPostFromId(widget.post);
    subredditModel = database.getSubreddit(postModel.subreddit);
    poster = database.getUserFromId(postModel.authorId);
    loggedInUser = UserSimplePreferences.getLoggedInUser();
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
        controller: scrollController,
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
              score: database.getUpvoteScore(postid),
              upvoted: database.getPostUpvotedForUser(loggedInUser, postid),
              downvoted: database.getPostDownvotedForUser(loggedInUser, postid),
              upvote: () {
                setState(() {
                  database.upvotePost(postid, loggedInUser);
                });
              },
              downvote: () {
                setState(() {
                  database.downvotePost(postid, loggedInUser);
                });
              },
            ),
            for (CommentModel comment
                in database.getCommentsForPost(widget.post)) ...[
              Comment(
                avatar: database.getUserFromId(comment.commenterId).avatar,
                comment: comment.comment,
                role: database.getUserFromId(comment.commenterId).title,
                username: database.getUserFromId(comment.commenterId).username,
                upvoteComment: () {
                  setState(() {
                    database.upvoteComment(comment.id, loggedInUser);
                  });                  
                },
                downvoteComment: () {
                  setState(() {
                    database.downvoteComment(comment.id, loggedInUser);
                  });                  
                },
                upvoted:
                    database.getCommentUpvotedForUser(loggedInUser, comment.id),
                downvoted: database.getCommentDownvotedForUser(
                    loggedInUser, comment.id),
                score: database.getCommentScore(comment.id),
              ),
            ],
            Form(
                key: _formKey,
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
                  width: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        onSaved: (newValue) {
                          comment = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter text';
                          }
                          return null;
                        },
                        controller: textEditingController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Write a comment...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          database.saveComment(CommentModel(
                              comment: comment,
                              postId: postid,
                              upvotes: [],
                              downvotes: [],
                              commenterId:
                                  UserSimplePreferences.getLoggedInUser()));
                          setState(() {
                            FocusScope.of(context).unfocus();
                            textEditingController.clear();
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                      },
                    )
                  ]),
                ))
          ],
        ),
      ),
      bottomNavigationBar: const ScaffoldFooter(),
    );
  }
}
