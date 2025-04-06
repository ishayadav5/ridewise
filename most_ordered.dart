import 'package:flutter/material.dart';

class MostOrderedPage extends StatelessWidget {
  const MostOrderedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Most Ordered Items"),
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text(
          "List of top items goes here.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
