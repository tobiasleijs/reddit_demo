class CommentDTO {
  final String comment;
  final int postId;
  final int commenterId;

  CommentDTO(
      {required this.comment,
      required this.postId,
      required this.commenterId});
}
