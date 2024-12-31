import 'package:e_com_ui/screens/profile/widgets/1_profile_tile.dart';
import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Row(
                children: [
                  const CustomText(
                    text: "Hey!",
                    textType: TextType.bodyLarge,
                    textWeight: TextWeight.bold,
                    color: Colors.black,
                  ),
                  8.horizontalSpace,
                  const CustomText(
                    text: "Rudra Mistry",
                    textType: TextType.bodyLarge,
                    textWeight: TextWeight.bold,
                    color: Colors.black,
                  ),
                ],
              ),
              30.verticalSpace,
              GridView.builder(
                itemCount: 4, // Total number of tiles
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 16.sp,
                  mainAxisSpacing: 16.sp,
                  childAspectRatio: 2.5, // Adjust this for rectangular tiles
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final tiles = [
                    const ProfileTile(
                        iconPath: 'assets/icons/orders.svg', label: 'Orders'),
                    const ProfileTile(
                        iconPath: 'assets/icons/wishlist.svg',
                        label: 'Wishlist'),
                    const ProfileTile(
                        iconPath: 'assets/icons/coupons.svg', label: 'Coupons'),
                    const ProfileTile(
                        iconPath: 'assets/icons/helpcenter.svg',
                        label: 'Help Center'),
                  ];
                  return tiles[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
