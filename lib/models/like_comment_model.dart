class LikeCommentModel {
  int? commentId;
  int? userId;

  LikeCommentModel({
    this.commentId,
    this.userId,
  });

  LikeCommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'userId': userId,
    };
  }
}
