import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dashboard_card.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.white,
  body: SingleChildScrollView(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  // 🔸 Center logo/image
  Center(
  child: Column(
  children: [
  Image.asset(
  'assets/food_space_image.png', // Add your logo in assets
  height: 170,
  ),
  const SizedBox(height: 10),
  const Text(
  "Admin",
  style: TextStyle(
  color: Colors.deepOrange,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  ),
  ),
  ],
  ),
  ),
  const SizedBox(height: 30),

  // 🔹 Square grid buttons

    GridView.count(
      crossAxisCount: 3, // ✅ 3 cards per row
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // disables scrolling inside GridView
      padding: const EdgeInsets.all(16),
  children: [
  DashboardCard(
  title: "Inventory",
  subtitle: "Manage food stock",
  icon: Icons.inventory,
  color: Colors.deepOrange,
  onTap: () => Navigator.pushNamed(context, '/inventory'),
  ),
  DashboardCard(
  title: "Complaints",
  subtitle: "Handle user feedback",
  icon: Icons.report_problem,
  color: Colors.redAccent,
  onTap: () => Navigator.pushNamed(context, '/complaints'),
  ),
  DashboardCard(
  title: "Peak Hours",
  subtitle: "See busy time slots",
  icon: Icons.access_time,
  color: Colors.orange,
  onTap: () => Navigator.pushNamed(context, '/peak_hours'),
  ),
  DashboardCard(
  title: "Most Ordered",
  subtitle: "Top-selling items",
  icon: Icons.fastfood,
  color: Colors.deepOrangeAccent,
  onTap: () => Navigator.pushNamed(context, '/most_ordered'),
  ),
  DashboardCard(
  title: "Total Users",
  subtitle: "Registered accounts",
  icon: Icons.people,
  color: Colors.red,
  onTap: () => Navigator.pushNamed(context, '/users'),
  ),
  DashboardCard(
  title: "Analytics",
  subtitle: "Graphical reports",
  icon: Icons.bar_chart,
  color: Colors.orangeAccent,
  onTap: () {
  // You can show analytics here or on another page
  },
  ),
  ],
  ),


    const SizedBox(height: 40),
  ],
  ),
  ),
  );
  }
  }
