class PostModel {
  final int id;
  final String title;
  final int authorId;
  final String subreddit;
  final String body;

  const PostModel(
      {required this.id,
      required this.title,
      required this.authorId,
      required this.subreddit,
      required this.body});

  PostModel copyWith({
    int? id,
    String? title,
    int? authorId,
    String? subreddit,
    String? body,
  }) =>
      PostModel(
          id: id ?? this.id,
          title: title ?? this.title,
          authorId: authorId ?? this.authorId,
          subreddit: subreddit ?? this.subreddit,
          body: body ?? this.body);
}
