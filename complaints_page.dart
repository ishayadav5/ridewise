import 'package:flutter/material.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint Management"),
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text(
          "Complaint Page",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
