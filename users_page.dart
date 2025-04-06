import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total Users"),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text(
          "User data and statistics will be shown here.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
