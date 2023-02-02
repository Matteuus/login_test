import 'package:flutter/material.dart';
import 'package:login_test/login_controller.dart';

LoginController loginController = LoginController();

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            key: const Key('usernameTextField'),
          ),
          TextField(
            controller: passwordController,
            key: const Key('passwordTextField'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            key: const Key('loginButton'),
            child: const Text("Login"),
            onPressed: () async {
              if (loginController.login(
                  usernameController.text, passwordController.text)) {
                await showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    key: Key('success'),
                    title: Text("Login Successful"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
