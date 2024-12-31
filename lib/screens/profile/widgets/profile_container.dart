import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  const CustomProfileText({
    required this.text,
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Makes the container occupy full width
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18.r, // Size of the circle
              backgroundColor:
                  Colors.grey.shade300, // Background color of the circle
              child: Icon(
                icon, // Customizable icon
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(width: 10.sp), // Adds space between the icon and text
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Metrophobic",
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
