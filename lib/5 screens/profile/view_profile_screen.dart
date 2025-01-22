import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com_ui/4%20view%20model/update_profile_view_model.dart';
import 'package:e_com_ui/5%20screens/auth/widgets/custom_textfield_label.dart';
import 'package:e_com_ui/5%20screens/profile/edit_profile_screen.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_app_bar.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_elevated_button.dart';
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UpdateProfileViewModel>().viewUserProfile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appbartext: "View Profile"),
      body: Consumer<UpdateProfileViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async => await viewModel.viewUserProfile(context),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: CachedNetworkImage(
                          width: 200.r,
                          height: 200.r,
                          fit: BoxFit.cover,
                          imageUrl: '',
                          errorWidget: (context, url, error) => CircleAvatar(
                            radius: 100.r,
                            child: const Icon(
                              CupertinoIcons.person,
                              size: 80,
                            ),
                          ),
                        ),
                      ),
                    ),
                    30.verticalSpace,

                    // Full Name Section
                    const CustomTextFieldLabel(
                      labelText: "Full Name*",
                      fontColor: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    8.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 50.sp,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.sp),
                      alignment: Alignment.centerLeft,
                      child:CustomText(
                        text: viewModel.fullname ?? "Not available",
                        color: Colors.black,
                        textType: TextType.bodyLarge,
                        textWeight: TextWeight.regular,
                      ),
                    ),
                    20.verticalSpace,

                    // Email Section
                    const CustomTextFieldLabel(
                      labelText: "Email*",
                      fontColor: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    8.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 50.sp,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.sp),
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: viewModel.email ?? "Not available",
                        color: Colors.black,
                        textType: TextType.bodyLarge,
                        textWeight: TextWeight.regular,
                      ),
                    ),
                    40.verticalSpace,

                    // Edit Profile Button
                    CustomElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                        // Refresh profile data when returning from edit screen
                        if (result == true) {
                          _loadProfileData();
                        }
                      },
                      text: "Edit Profile",
                      icon: Icons.edit_outlined,
                      height: 50.sp,
                      width: double.infinity,
                      backgroundColor: Colors.blue,
                      borderColor: Colors.blue,
                      borderWidth: 1,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
