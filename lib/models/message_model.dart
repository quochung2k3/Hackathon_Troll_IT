class MessageModel {
  int? id;
  int? senderId;
  int? receiverId;
  String? content;
  DateTime? createdDate;

  MessageModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.content,
    this.createdDate,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    content = json['content'];
    createdDate = DateTime.parse(json['createdDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'createdDate': createdDate?.toIso8601String(),
    };
  }
}
