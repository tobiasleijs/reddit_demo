class CommentModel {
  final String comment;
  final int postId;
  final int commenterId;

  const CommentModel(
      {required this.comment, required this.postId, required this.commenterId});

  CommentModel copyWith({String? comment, int? postId, int? commenterId}) =>
      CommentModel(
          comment: comment ?? this.comment,
          postId: postId ?? this.postId,
          commenterId: commenterId ?? this.commenterId);
}
