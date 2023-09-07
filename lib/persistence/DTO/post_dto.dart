class PostDTO {
  final int id;
  final String title;
  final int authorId;
  final String subreddit;
  final String body;

  PostDTO(
      {required this.id,
      required this.title,
      required this.authorId,
      required this.subreddit,
      required this.body});
}
