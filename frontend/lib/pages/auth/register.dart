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

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation; // Animation for sliding effect

  bool showSecondForm = false; // Flag to switch between forms

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Initialize sliding animation for the first form
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Start position (off-screen right)
      end: const Offset(0, 0), // End position (fully visible)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation for the first form
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void handleNextStep() {
    // Validate first form inputs
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      setState(() {
        showSecondForm = true; // Show the second set of text fields
        _controller.reset(); // Reset animation for sliding transition

        // Initialize sliding animation for the second form
        _slideAnimation = Tween<Offset>(
          begin: const Offset(1, 0), // Start position (off-screen right)
          end: const Offset(0, 0), // End position (fully visible)
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));

        _controller.forward(); // Start the sliding animation
      });
    } else {
      showAlertDialog(context, 'Error', 'Please fill all the required fields.');
    }
  }

  void handleRegister() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      showAlertDialog(context, 'Error', 'Passwords do not match');
      return;
    }

    final registerModel = RegisterModel(
      userName: username,
      userFirstName: _firstNameController.text,
      userLastName: _lastNameController.text,
      userEmail: _emailController.text,
      userPhoneNumber: _phoneController.text,
      userPassword: password,
    );

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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 58, 25, 114), const Color.fromARGB(255, 180, 208, 255)],
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 100),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Progress Indicator
                ProgressIndicatorWidget(isSecondFormActive: showSecondForm),

                const SizedBox(height: 16),
                // Show sliding transition for forms
                SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: [
                      // Show first form
                      if (!showSecondForm) ...[
                        _buildTextField(
                          controller: _firstNameController,
                          label: 'First Name',
                          icon: Icons.text_fields,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _lastNameController,
                          label: 'Last Name',
                          icon: Icons.text_fields,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _phoneController,
                          label: 'Phone Number',
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 24), // Adjusted height
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: handleNextStep,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.purpleAccent,
                              elevation: 10,
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                      // Show second form
                      if (showSecondForm) ...[
                        _buildTextField(
                          controller: _usernameController,
                          label: 'Username',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          icon: Icons.lock,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          icon: Icons.lock,
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: handleRegister,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Colors.purpleAccent,
                              elevation: 10,
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('OR'),
                const SizedBox(height: 16),
                Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _buildSocialIcon(
      icon: FontAwesomeIcons.google,
      color: Colors.red,
      onPressed: () {},
    ),
    const SizedBox(width: 16),
    _buildSocialIcon(
      icon: FontAwesomeIcons.facebook,
      color: Colors.blue,
      onPressed: () {},
    ),
    const SizedBox(width: 16),
    _buildSocialIcon(
      icon: FontAwesomeIcons.linkedin,
      color: Colors.blue,
      onPressed: () {},
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

  Widget _buildSocialIcon({required IconData icon, required Color color, required VoidCallback onPressed}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2), // Shadow position
        ),
      ],
    ),
    child: IconButton(
      icon: Icon(icon, color: color),
      onPressed: onPressed,
    ),
  );
}
}

class ProgressIndicatorWidget extends StatelessWidget {
  final bool isSecondFormActive;

  const ProgressIndicatorWidget({super.key, required this.isSecondFormActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor:  Colors.green ,
        ),
        const SizedBox(width: 8),
        const Text(
          'Step 1',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 16),
        CircleAvatar(
          radius: 12,
          backgroundColor: isSecondFormActive ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 8),
        const Text(
          'Step 2',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}