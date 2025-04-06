import 'package:flutter/material.dart';

import 'admin_dashboard.dart';
import 'inventory_page.dart';
import 'complaints_page.dart';
import 'peak_hours.dart';
import 'most_ordered.dart';
import 'users_page.dart';

void main() {
  runApp(const FoodSpaceApp());
}

class FoodSpaceApp extends StatelessWidget {
  const FoodSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Space Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const AdminDashboard(),
      routes: {
        '/inventory': (context) => InventoryPage(),
        '/complaints': (context) => ComplaintPage(),
        '/peak_hours': (context) => PeakHoursPage(),
        '/most_ordered': (context) => MostOrderedPage(),
        '/users': (context) => UsersPage(),
      },
    );
  }
}
