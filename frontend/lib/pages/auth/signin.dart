import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final String username = usernameController.text;
    final String password = passwordController.text;

    // here need to code to send the uname and pswd to backend for verification.

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New to NeverNote? Click'),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to registration page
                        // Implement navigation logic here
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('Log in'),
                ),
                const SizedBox(height: 24),
                const Text('or log in with'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.google),
                      onPressed: () {
                        // Handle Google login
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.github),
                      onPressed: () {
                        // Handle GitHub login
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        // Handle LinkedIn login
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}