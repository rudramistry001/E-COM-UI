
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeAgo;
  final bool isDiscountNotification;
  final String? trailingImage;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    this.isDiscountNotification = false,
    this.trailingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16.w, vertical: 12.h), // Balanced padding
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 216, 215, 215), // Bottom border color
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading Icon for Discount Notifications
          if (isDiscountNotification)
            Padding(
              padding:
                  EdgeInsets.only(right: 12.w), // Space between icon and text
              child: SvgPicture.asset(
                'assets/icons/discount.svg',
                height: 24.sp,
                color: Colors.blue,
              ),
            ),

          // Main Text and Time Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                CustomText(
                  text: title,
                  textType: TextType.bodySmall,
                  color: Colors.black,
                  textWeight: TextWeight.bold,
                ),
                SizedBox(height: 4.h),

                // Subtitle
                CustomText(
                  text: subtitle,
                  textType: TextType.caption,
                  color: Colors.black87,
                  textWeight: TextWeight.regular,
                ),
                SizedBox(height: 6.h),

                // Time Ago
                CustomText(
                  text: timeAgo,
                  textType: TextType.caption,
                  color: Colors.grey,
                  textWeight: TextWeight.light,
                ),
              ],
            ),
          ),

          // Trailing Image (if exists)
          if (trailingImage != null)
            Padding(
              padding:
                  EdgeInsets.only(left: 12.w), // Space between text and image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r), // Rounded corners
                child: Image.network(
                  trailingImage!,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover, // Ensures the image covers the space
                ),
              ),
            ),
        ],
      ),
    );
  }
}
