import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileTile extends StatelessWidget {
  final String iconPath;
  final String label;

  const ProfileTile({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for better responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // Add navigation or action here
      },
      child: Container(
        width: screenWidth * 0.4, // Responsive width based on screen size
        height: screenHeight * 0.08, // Responsive height based on screen size
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r), // Scaled for responsiveness
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon on the left
            SvgPicture.asset(
              iconPath,
              height: 24.r, // Use `r` for square dimensions
              width: 24.r,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
            SizedBox(width: 12.w), // Space between icon and text
            // Label text
            Expanded(
              child: CustomText(
                text: label,
                textType: TextType.bodySmall,
                textWeight: TextWeight.light,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
