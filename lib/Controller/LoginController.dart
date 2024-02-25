import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DAO/user_dao.dart';
import '../models/user_model.dart';
import '../widgets/PostPage.dart';

class LoginController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  BuildContext context;
  LoginController(this.context);
  void signIn() {
    String username = usernameController.text;
    String password = passwordController.text;
    UserModel user = new UserModel();
    user.email = username;
    user.password = password;
    // Validate username and password if needed
    if (1 == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostPage()), // Chuyển hướng tới giao diện PostPage
      );
      // Clear text fields after sign in
      usernameController.clear();
      passwordController.clear();
    } else {
      // Handle empty fields or any validation you may need
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Trả về một AlertDialog
          return AlertDialog(
            title: Text("Thông báo"),
            content: Text("Tên người dùng hoặc mật khẩu không đúng."),
            actions: <Widget>[
              // Nút đóng hộp thoại
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng hộp thoại
                },
                child: Text("Đóng"),
              ),
            ],
          );
        },
      );
    }
  }
}