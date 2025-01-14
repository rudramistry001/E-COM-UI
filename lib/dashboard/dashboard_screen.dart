import 'package:e_com_ui/screens/categories/categories_screen.dart';
import 'package:e_com_ui/screens/profile/profilescreen.dart';
import 'package:e_com_ui/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_com_ui/dashboard/home_screen.dart';
import 'package:e_com_ui/dashboard/notification/notification_screen.dart';
import 'package:e_com_ui/screens/cart/cart_screen.dart';
import 'package:e_com_ui/dashboard/widgets/bottom_nav_bar.dart';

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
    HomeScreen2(),
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
