// Buoc 1: Khai bao import thu vien
import 'package:flutter/material.dart';
import 'package:hackathon_troll_it/widgets/UserInfo.dart';
import 'package:hackathon_troll_it/widgets/login.dart';
import 'package:hackathon_troll_it/widgets/message.dart';
import 'package:hackathon_troll_it/widgets/register.dart';

// Buoc 2: Main
void main() {
  // Buoc 3: Kho dong app
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
      //home: LoginPage(),
      //home: RegisterPage(),
      //home: userinfoPage(),
      home: messagePage(),
    );
  }
}
  


