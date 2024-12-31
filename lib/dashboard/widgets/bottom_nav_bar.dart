import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70
          .h, // Increase this value to adjust the height of the bottom nav bar
      child: BottomNavigationBar(
        currentIndex: currentIndex, // Bind the selected index
        onTap: onItemTapped, // Trigger the callback
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        type: BottomNavigationBarType.fixed, // Keep all items fixed
        iconSize: 24.sp, // Increase the icon size
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
