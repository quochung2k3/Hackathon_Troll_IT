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
    id = json['mess_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    content = json['content'];
    createdDate = json['created_date'] as DateTime?;
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
