class PostModel {
  int? id;
  int? userId;
  int? flairId;
  String? title;
  String? content;
  int? likes;
  bool? anonymous;
  DateTime? createdDate;

  PostModel({
    this.id,
    this.userId,
    this.flairId,
    this.title,
    this.content,
    this.likes,
    this.anonymous,
    this.createdDate,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    flairId = json['flairId'];
    title = json['title'];
    content = json['content'];
    likes = json['likes'];
    anonymous = json['anonymous'];
    createdDate = DateTime.parse(json['createdDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'flairId': flairId,
      'title': title,
      'content': content,
      'likes': likes,
      'anonymous': anonymous,
      'createdDate': createdDate?.toIso8601String(),
    };
  }
}
