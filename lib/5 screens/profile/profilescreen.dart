
import 'package:e_com_ui/4%20view%20model/register_view_model.dart';
import 'package:e_com_ui/5%20screens/auth/widgets/custom_divider.dart';
import 'package:e_com_ui/5%20screens/profile/change_address_screen.dart';
import 'package:e_com_ui/5%20screens/profile/edit_profile_screen.dart';
import 'package:e_com_ui/5%20screens/profile/view_profile_screen.dart';
import 'package:e_com_ui/5%20screens/profile/widgets/1_profile_tile.dart';
import 'package:e_com_ui/5%20screens/profile/widgets/profile_container.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_elevated_button.dart';
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 RegisterViewModel registerViewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
              10.verticalSpace,
              const CustomLineDivider(
                thickness: 1.0,
                indent: 0.0,
                endIndent: 0.0,
              ),
              10.verticalSpace,
              const CustomText(
                text: "Account Settings",
                textType: TextType.bodyLarge,
                textWeight: TextWeight.bold,
                color: Colors.black,
              ),
              10.verticalSpace,
              CustomProfileWidget(
                text: "Manage Your Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewProfileScreen()),
                  );
                },
                icon: Icons.person_outlined,
              ),
              10.verticalSpace,
              CustomProfileWidget(
                text: "Saved Cards & Wallets",
                onTap: () {},
                icon: Icons.payment_outlined,
              ),
              10.verticalSpace,
              CustomProfileWidget(
                text: "Saved Addresses",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressScreen()),
                  );
                },
                icon: Icons.location_on_outlined,
              ),
              10.verticalSpace,
              CustomProfileWidget(
                text: "Select Language",
                onTap: () {},
                icon: Icons.language,
              ),
              10.verticalSpace,
              CustomProfileWidget(
                text: "Notification Settings",
                onTap: () {},
                icon: Icons.notifications_active_outlined,
              ),
              const CustomLineDivider(
                thickness: 1.0,
                indent: 0.0,
                endIndent: 0.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Send Feedback',
                  textType: TextType.caption,
                  textWeight: TextWeight.regular,
                  color: Colors.black,
                ),
              ),
              10.verticalSpace,
              const Align(
                alignment: Alignment.centerLeft,
                child: const CustomText(
                  text: 'Report A Safety Emergency',
                  textType: TextType.caption,
                  textWeight: TextWeight.regular,
                  color: Colors.black,
                ),
              ),
              10.verticalSpace,
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Rate us on the Play Store',
                  textType: TextType.caption,
                  textWeight: TextWeight.regular,
                  color: Colors.black,
                ),
              ),
              20.verticalSpace,
              
            CustomElevatedButton(
                 onPressed: () {
              registerViewModel.logoutUser(context);
              },
                text: "Log Out",
                icon: Icons.logout_outlined,
                height: 50.sp,
                width: double.infinity,
                backgroundColor: Colors.red,
                borderColor: Colors.red,
                borderWidth: 1,
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
              50.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Text(
                  "D Commerce",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: "DancingScript",
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "v1.0.0",
                  style: TextStyle(
                    fontFamily: "Metrophobic",
                    fontSize: 20.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              70.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
