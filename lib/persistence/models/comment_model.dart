class CommentModel {
  final int id;
  final String comment;
  final int postId;
  final int commenterId;
  final List<int> upvotes;
  final List<int> downvotes;

  const CommentModel(
      {this.id = 0,
      required this.comment,
      required this.postId,
      required this.commenterId,
      required this.upvotes,
      required this.downvotes});

  CommentModel copyWith(
          {int? id,
          String? comment,
          int? postId,
          int? commenterId,
          List<int>? upvotes,
          List<int>? downvotes}) =>
      CommentModel(
          id: id ?? this.id,
          comment: comment ?? this.comment,
          postId: postId ?? this.postId,
          commenterId: commenterId ?? this.commenterId,
          upvotes: upvotes ?? this.upvotes,
          downvotes: downvotes ?? this.downvotes);
}
