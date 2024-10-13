import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nevernote/services/signin_service.dart';
import 'package:nevernote/models/signin_model.dart';
import 'package:nevernote/helpers/alert_helper.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignInService _signInService = SignInService();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the page is loaded
    _controller.forward();
  }

  Future<void> handleLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final signInModel = SignInModel(
      userName: username,
      userPassword: password,
    );

    print('Logging in with username: $username and password: $password');

    LoginResponse response = await _signInService.login(signInModel);

    if (response.success) {
      print('Login successful! Token: ${response.token}');
      showAlertDialog(context, 'Success', 'Login successful!');
      // Navigate to the next screen
    } else {
      print('Login failed: ${response.error}');
      showAlertDialog(context, 'Error', response.error ?? 'Login failed. Please try again.');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 450),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 58, 25, 114),
                const Color.fromARGB(255, 180, 208, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5), // Shadow position
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Centered Log In Header with Register Button on the Right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
  onPressed: () {
    Navigator.pushNamed(context, '/register');
  },
  child: const Text(
    'Register',
    style: TextStyle(color: Colors.white),
  ),
),
                ],
              ),
              const SizedBox(height: 48),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // Start from right
                  end: Offset.zero, // End at the original position
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                )),
                child: _buildTextField(
                  controller: _usernameController,
                  label: 'Username',
                  icon: Icons.person,
                ),
              ),
              const SizedBox(height: 16),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // Start from right
                  end: Offset.zero, // End at the original position
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                )),
                child: _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                          width: double.infinity,
                          child: 
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Log in', style: TextStyle(color: Colors.white)),
              ),
              ),
              const SizedBox(height: 24),
              const Text('OR', style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconButton(FontAwesomeIcons.google, Colors.red, () {
                    // Handle Google login
                  }),
                  const SizedBox(width: 16),
                  _buildIconButton(FontAwesomeIcons.facebook, Colors.blue, () {
                    // Handle Facebook login
                  }),
                  const SizedBox(width: 16),
                  _buildIconButton(FontAwesomeIcons.linkedin, Colors.blue, () {
                    // Handle LinkedIn login
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurpleAccent),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
        padding: const EdgeInsets.all(1),
      ),
    );
  }
}