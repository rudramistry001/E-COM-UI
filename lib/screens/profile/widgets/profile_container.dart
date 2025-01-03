import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  const CustomProfileWidget({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 22.sp,
                  color: Colors.blue,
                ),
                SizedBox(width: 10.sp), // Adds space between the icon and text
                CustomText(
                  text: text,
                  textType: TextType.bodyLarge,
                  textWeight: TextWeight.regular,
                  color: Colors.black,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
