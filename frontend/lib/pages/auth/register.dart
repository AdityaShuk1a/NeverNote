import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nevernote/services/register_service.dart';
import 'package:nevernote/models/register_model.dart';
import 'package:nevernote/helpers/alert_helper.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void handleRegister() {
    final username = _usernameController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Checking if password and confirm password match
    if (password != confirmPassword) {
      showAlertDialog(context ,'Error', 'Passwords do not match');
      return;
    }

    final registerModel = RegisterModel(
      userName: username,
      userFirstName: firstName,
      userLastName: lastName,
      userEmail: email,
      userPhoneNumber: phone,
      userPassword: password,
    );

    // Creating RegisterService instance and calling registerUser
    final registerService = RegisterService();
    registerService.registerUser(registerModel).then((message) {
      if (message != null && message.contains('successfully')) {
        showAlertDialog(context, 'Success', message);
      } else {
        showAlertDialog(context, 'Error', message ?? 'Registration failed. Please try again.');
      }
    }).catchError((error) {
      showAlertDialog(context, 'Error', 'An error occurred. Please try again.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                    const Text('Already a member? Click'),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to sign in
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: const Text('Log in'),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: handleRegister,
                  child: const Text('Register'),
                ),
                const SizedBox(height: 24),
                const Text('or register with'),
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
