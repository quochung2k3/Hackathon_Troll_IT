class CommentModel {
  int? id;
  int? postId;
  int? userId;
  int? parentId;
  String? content;
  int? likes;
  DateTime? createdDate;
  int? totalLikeComment;

  CommentModel({
    this.id,
    this.postId,
    this.userId,
    this.parentId,
    this.content,
    this.likes,
    this.createdDate,
    this.totalLikeComment
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    parentId = json['parent_id'];
    content = json['content'];
    likes = json['likes'];
    createdDate = DateTime.parse(json['created_date']);
    totalLikeComment = json['total_like_comment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'userId': userId,
      'parentId': parentId,
      'content': content,
      'likes': likes,
      'createdDate': createdDate?.toIso8601String(),
      'totalLikeComment' : totalLikeComment,
    };
  }
}
