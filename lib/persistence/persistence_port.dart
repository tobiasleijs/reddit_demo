import 'package:reddit_app/persistence/models/comment_model.dart';
import 'package:reddit_app/persistence/models/post_model.dart';
import 'package:reddit_app/persistence/models/subreddit_model.dart';
import 'package:reddit_app/persistence/models/user_model.dart';

abstract class PersistencePort {
  PostModel getPostFromId(int postId);
  List<PostModel> getPosts();
  CommentModel getCommentFromPostId(int postId);
  List<CommentModel> getCommentsForPost(int postId);
  SubredditModel getSubreddit(String name);
  List<String> getSubredditNames();
  UserModel getUserFromId(int userId);
  void savePost(PostModel postModel);
  void saveComment(CommentModel commentModel);
  void upvoteComment(int commentId, int userId);
  void downvoteComment(int commentId, int userId);
  int getCommentScore(int commentId);
  bool getCommentUpvotedForUser(int userId, int commentId);
  bool getCommentDownvotedForUser(int userId, int commentId);
  void upvotePost(int postId, int userId);
  void downvotePost(int postId, int userId);
  int getUpvoteScore(int postId);
  int? loginUser(String email, String password);
  bool getPostUpvotedForUser(int userId, int postId);
  bool getPostDownvotedForUser(int userId, int postId);
}
