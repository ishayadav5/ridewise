import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Full page black background
      appBar: AppBar(
        title: const Text(
          "Let us know more about you!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // App bar black background
        elevation: 0, // No shadow under app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center the content vertically
            children: [
              // RIDEWISE Text (Bigger font size)
              const Text(
                'RIDEWISE',
                style: TextStyle(
                  fontSize: 40, // Larger font size
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16), // Space between RIDEWISE and Sign Up

              // Sign Up Text (Normal font size)
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24, // Regular font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32), // Space between Sign Up and First Name

              // First Name Field
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'First Name',
                  hintStyle: const TextStyle(color: Colors.black54),
                ),
                style: const TextStyle(color: Colors.black), // Black text
              ),
              const SizedBox(height: 16),

              // Last Name Field
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Last Name',
                  hintStyle: const TextStyle(color: Colors.black54),
                ),
                style: const TextStyle(color: Colors.black), // Black text
              ),
              const SizedBox(height: 32),

              // Proceed Button
              ElevatedButton(
                onPressed: () {
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  debugPrint('First Name: $firstName, Last Name: $lastName');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black, // Change foreground color to black
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
