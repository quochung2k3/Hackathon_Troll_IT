class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  DateTime? createdDate;
  String? passwordOld;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.createdDate,
    this.passwordOld,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    createdDate = DateTime.parse(json['createdDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'createdDate': createdDate?.toIso8601String(),
    };
  }
}
