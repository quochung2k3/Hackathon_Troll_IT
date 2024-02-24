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

  PostModel.fromDB(List<dynamic> json) {
    id = json[0] as int;
    title = json[1] as String;
    content = json[2] as String;
    likes = json[3] as int;
    anonymous = json[4] as bool;
    userId = json[5] as int;
    flairId = json[6] as int;
    createdDate = json[7] as DateTime;
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userId = json['user_id'] as int?;
    flairId = json['flair_id'] as int?;
    title = json['title'] as String?;
    content = json['content'] as String?;
    likes = json['likes'] as int?;
    anonymous = json['anonymous'] as bool?;
    createdDate = json['created_date'] as DateTime?;
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
