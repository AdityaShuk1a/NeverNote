import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nevernote/services/signin_service.dart';
import 'package:nevernote/models/signin_model.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignInServices _signInServices = SignInServices(); 

  Future<void> handleLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    print('Logging in with username: $username and password: $password');


    LoginResponse response = await _signInServices.login(username, password);

    if (response.success) {
      // same here as in register.dart (just above) theorizing what happens when we get response signalling that the username and pasword match in database. I think we should Navigate to the next screen or show a success message
      print('Login successful! Token: ${response.token}');
    } else {
      print('Login failed: ${response.error}');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 400),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to NeverNote? Click'),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: (){
                      // goto register page
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: handleLogin,
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
                    icon: const Icon(FontAwesomeIcons.facebook),
                    onPressed: () {
                      // Handle Facebook login
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.linkedin),
                    onPressed: () {
                      // Handle Linkedin login
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
