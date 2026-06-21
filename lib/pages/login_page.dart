import 'package:flutter/material.dart';

import 'forgot_password_page.dart';

import 'welcome_page.dart';

import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset('assets/images/logo.png', height: 120),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,

              decoration: const InputDecoration(labelText: 'Email'),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,

              obscureText: true,

              decoration: const InputDecoration(labelText: 'Password'),
            ),

            Align(
              alignment: Alignment.centerRight,

              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },

                child: const Text('Forgot Password?'),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                try {
                  await auth.login(
                    emailController.text,

                    passwordController.text,
                  );

                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },

              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
