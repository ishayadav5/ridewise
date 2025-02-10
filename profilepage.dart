import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // After adding the dependency
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image; // To store the selected image
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();
  String? _selectedGender = 'Male'; // Default gender
  String? _selectedDate;

  // Function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Method to show image source options (camera or gallery)
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // User Photo Section
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showImageSourceDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[800],
                    child: _image == null
                        ? const Icon(Icons.camera_alt, size: 40, color: Colors.white)
                        : ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Username Field
              const Text(
                'Username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 20),
              // Phone Number Field
              const Text(
                'Phone Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
                  hintText: 'Enter your phone number',
                ),
              ),
              const SizedBox(height: 20),
              // Gmail Field
              const Text(
                'Gmail',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                controller: gmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
                  hintText: 'Enter your Gmail',
                ),
              ),
              const SizedBox(height: 20),
              // Gender Field
              const Text(
                'Gender',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              DropdownButton<String>(
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Age Field
              const Text(
                'Age',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
                  hintText: 'Enter your age',
                ),
              ),
              const SizedBox(height: 40),
              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save button logic
                    final username = usernameController.text;
                    final phone = phoneController.text;
                    final gmail = gmailController.text;
                    final gender = _selectedGender;

                    debugPrint('User Info - Username: $username, Phone: $phone, Gmail: $gmail, Gender: $gender');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
