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
  UserModel getUserFromId(int userId);
}
