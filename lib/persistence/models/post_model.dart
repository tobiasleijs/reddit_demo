class PostModel {
  final int id;
  final String title;
  final int authorId;
  final String subreddit;
  final String body;
  final List<int> upvotes;
  final List<int> downvotes;

  const PostModel(
      {required this.id,
      required this.title,
      required this.authorId,
      required this.subreddit,
      required this.body,
      required this.upvotes,
      required this.downvotes});

  PostModel copyWith({
    int? id,
    String? title,
    int? authorId,
    String? subreddit,
    String? body,
    List<int>? upvotes,
    List<int>? downvotes,
  }) =>
      PostModel(
          id: id ?? this.id,
          title: title ?? this.title,
          authorId: authorId ?? this.authorId,
          subreddit: subreddit ?? this.subreddit,
          body: body ?? this.body,
          upvotes: upvotes ?? this.upvotes,
          downvotes: downvotes ?? this.downvotes);
}
