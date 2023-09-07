import 'package:reddit_app/persistence/DTO/comment_dto.dart';
import 'package:reddit_app/persistence/DTO/post_dto.dart';
import 'package:reddit_app/persistence/DTO/subreddit_dto.dart';
import 'package:reddit_app/persistence/DTO/user_dto.dart';

abstract class PersistencePort {
  PostDTO getPostFromId(int postId);
  List<PostDTO> getPosts();
  CommentDTO getCommentFromPostId(int postId);
  List<CommentDTO> getCommentsForPost(int postId);
  SubredditDTO getSubreddit(String name);
  UserDTO getUserFromId(int userId);
}
