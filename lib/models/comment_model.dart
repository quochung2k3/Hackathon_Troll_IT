class CommentModel {
  int? id;
  int? postId;
  int? userId;
  int? parentId;
  String? content;
  int? likes;
  DateTime? createdDate;

  CommentModel({
    this.id,
    this.postId,
    this.userId,
    this.parentId,
    this.content,
    this.likes,
    this.createdDate,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    userId = json['userId'];
    parentId = json['parentId'];
    content = json['content'];
    likes = json['likes'];
    createdDate = DateTime.parse(json['createdDate']);
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
    };
  }
}
