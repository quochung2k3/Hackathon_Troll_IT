class IdMessageResponse {
  int? id;
  String? message;

  IdMessageResponse({this.id, this.message});

  IdMessageResponse.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['Message'] = this.message;
    return data;
  }
}
