import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String  hintText;
  final Function(String) onChanged;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 24.sp,
        ), // Responsive icon size
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: "Metrophobic",
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: const BorderSide(color: Colors.cyan),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      style: TextStyle(
          fontFamily: "Metrophobic",
          fontSize: 18.sp,
          fontWeight: FontWeight.bold), // Responsive text size
    );
  }
}
