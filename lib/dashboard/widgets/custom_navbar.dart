import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final int selectedIndex;
  final Function(int) onTap;
  final double iconSize;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double itemPadding;

  const CustomNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.black,
    this.selectedItemColor = Colors.red,
    this.unselectedItemColor = Colors.grey,
    this.itemPadding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          NavBarItem item = entry.value;
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? itemPadding.w : (itemPadding / 2).w,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? selectedItemColor.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    size: iconSize.sp,
                    color: isSelected ? selectedItemColor : unselectedItemColor,
                  ),
                  if (isSelected)
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Text(
                        item.label,
                        style: TextStyle(
                          color: selectedItemColor,
                          fontFamily: "Metrophobic",
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavBarItem {
  final IconData icon;
  final String label;

  NavBarItem({
    required this.icon,
    required this.label,
  });
}
