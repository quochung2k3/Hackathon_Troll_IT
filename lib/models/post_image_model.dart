class PostImageModel {
  int? id;
  int? postId;
  String? imageLink;

  PostImageModel({
    this.id,
    this.postId,
    this.imageLink,
  });

  PostImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    imageLink = json['imageLink'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'imageLink': imageLink,
    };
  }
}
