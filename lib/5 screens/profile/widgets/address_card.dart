
import 'package:e_com_ui/5%20screens/auth/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const AddressCard({
    super.key,
    required this.title,
    required this.address,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300, // Set the border color
              width: 1.0, // Set the border width
            ),
            borderRadius:
                BorderRadius.circular(8.r), // Optional: Rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: "Metrophobic",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                address,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontFamily: "Metrophobic",
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: onEditPressed,
                    child: Text(
                      'EDIT',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: onDeletePressed,
                    child: Text(
                      'DELETE',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        10.verticalSpace,
        CustomLineDivider(
          thickness: 2.0,
          indent: 0.0,
          endIndent: 0.0,
        ),
        10.verticalSpace,
      ],
    );
  }
}
