import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_troll_it/widgets/PostPage.dart';
import 'package:hackathon_troll_it/widgets/UserInfo.dart';
import 'package:hackathon_troll_it/widgets/login.dart';
import 'package:hackathon_troll_it/widgets/message.dart';
import 'package:hackathon_troll_it/widgets/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Chúng ta sử dụng MaterialApp để quản lý điều hướng của toàn bộ ứng dụng
      // Thay vì gán trực tiếp một trang làm trang chính, chúng ta sẽ sử dụng MaterialApp để quản lý điều hướng
      initialRoute: '/login', // Đặt màn hình đầu tiên khi ứng dụng khởi động
      routes: {
        // Đăng ký tên cho các màn hình để sử dụng điều hướng
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/userinfo': (context) => userinfoPage(),
        '/message': (context) => messagePage(),
        '/post': (context) => PostPage(),
      },
    );
  }
}