class LikePostModel {
  int? postId;
  int? userId;

  LikePostModel({
    this.postId,
    this.userId,
  });

  LikePostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
    };
  }
}
