import 'package:flutter/material.dart';
import 'package:ridewise/IntroPage.dart';
import 'package:ridewise/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RideWise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCountry = '+91'; // Default country code
  List<Map<String, String>> countries = [
    {'name': 'India', 'code': '+91', 'flag': '🇮🇳'},
    {'name': 'USA', 'code': '+1', 'flag': '🇺🇸'},
    {'name': 'UK', 'code': '+44', 'flag': '🇬🇧'},
    {'name': 'Australia', 'code': '+61', 'flag': '🇦🇺'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RideWise', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('assets/images/ridewise.jpg'),
              ),
            ),
            const SizedBox(height: 20), // Spacing between image and text
            const Center(
              child: Text(
                'Get started with RideWise',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30), // Space after the heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 10), // Space before dropdown and text input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: selectedCountry,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                    items: countries
                        .map((country) => DropdownMenuItem<String>(
                      value: country['code'],
                      child: Row(
                        children: [
                          Text(country['flag']!),
                          const SizedBox(width: 8),
                          Text('${country['name']} (${country['code']})'),
                        ],
                      ),
                    ))
                        .toList(),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your phone number',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Space before the button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Replace print with actual logic or remove it in production
                  debugPrint("Phone number submitted");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.white, // Text color
                ),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 20), // Space before the button
            Center(
              child: TextButton(
                onPressed: () {
                  // Replace print with actual logic or remove it in production
                  debugPrint("signing in");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white60, // Button background color
                  //foregroundColor: Colors.white, // Text color
                ),
                child: const Text('New on RideWise? Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
