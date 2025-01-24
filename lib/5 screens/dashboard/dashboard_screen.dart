
import 'package:e_com_ui/5%20screens/categories/categories_screen.dart';
import 'package:e_com_ui/5%20screens/dashboard/widgets/bottom_nav_bar.dart';
import 'package:e_com_ui/5%20screens/notification/notification_screen.dart';
import 'package:e_com_ui/5%20screens/profile/profilescreen.dart';
import 'package:e_com_ui/5%20screens/search/search_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // List of pages corresponding to each tab
  final List<Widget> _pages = [
    const HomeScreen(),
    const HomeScreen2(),
    const NotificationScreen(),
    const SearchScreen(),
    const ProfileScreen(), // Added ProfileScreen here
  ];

  // Method to update the selected index and display the appropriate page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex, // Pass the current index
        onItemTapped: _onItemTapped, // Pass the callback function
      ),
    );
  }
}
