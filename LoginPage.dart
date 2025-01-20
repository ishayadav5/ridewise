import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: const Text('Login'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50), // Spacing at the top
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[850], // Dark gray background for the container
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Verify OTP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text color
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Enter the OTP sent to your phone number or email:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white, // White text color
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: otpController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // White background for the input box
                        border: const OutlineInputBorder(),
                        hintText: 'Enter OTP',
                        hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Spacing between sections
              const Text(
                'How should we call you?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // White background for the input box
                  border: const OutlineInputBorder(),
                  hintText: 'Enter your username',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                ),
              ),
              const SizedBox(height: 30), // Spacing before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String otp = otpController.text;
                    String username = usernameController.text;

                    // You can add validation and navigation logic here
                    if (otp.isEmpty || username.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                    } else {
                      debugPrint('OTP: $otp, Username: $username');
                      // Navigate to the HomePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White button background
                    foregroundColor: Colors.black, // Black text color
                  ),
                  child: const Text('Proceed'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a HomePage widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for the HomePage
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text color
          ),
        ),
      ),
    );
  }
}
