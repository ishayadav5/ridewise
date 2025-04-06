import 'package:flutter/material.dart';

class PeakHoursPage extends StatelessWidget {
  const PeakHoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peak Hours"),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text(
          "Details about peak hours will appear here.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
