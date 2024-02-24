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
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    createdDate = json['created_date'] as DateTime?;
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
