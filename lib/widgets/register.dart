import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Username", usernameController),
            const SizedBox(height: 20),
            _inputField("PhoneNumber", phonenumberController),
            const SizedBox(height: 20),
            _inputField("Email", emailController),
            const SizedBox(height: 20),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 20),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Username: " + usernameController.text);
        debugPrint("PhoneNumber: " + phonenumberController.text);
        debugPrint("Email:" + emailController.text);
        debugPrint("Password : " + passwordController.text);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign up",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _extraText() {
    return const Text("Cann't access to your account?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
