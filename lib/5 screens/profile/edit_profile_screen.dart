import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com_ui/1%20model/profile/update_profile_model.dart';
import 'package:e_com_ui/4%20view%20model/update_profile_view_model.dart';
import 'package:e_com_ui/5%20screens/auth/widgets/custom_textfield_label.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_app_bar.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final viewModel = context.read<UpdateProfileViewModel>();
    await viewModel.viewUserProfile(context);

    if (viewModel.fullname != null && viewModel.email != null) {
      setState(() {
        _nameController.text = viewModel.fullname!;
        _emailController.text = viewModel.email!;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleUpdateProfile(UpdateProfileViewModel viewModel) async {
    if (_formKey.currentState!.validate()) {
      // Ensure we capture the latest values in the text fields
      final updateProfile = UpdateProfileModel(
        fullname: _nameController.text,
        email: _emailController.text,
      );

      // Debugging: Log the controller values to ensure they are correct
      print("Captured Full Name: ${_nameController.text}");
      print("Captured Email: ${_emailController.text}");

      await viewModel.updateuser(context, updateProfile);

      // Optional: Handle response and notify
      if (mounted) {
        Navigator.pop(context, true); // Optionally return to previous screen
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appbartext: "Edit Profile",
      ),
      body: Consumer<UpdateProfileViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image Section
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: CachedNetworkImage(
                            width: 200.r,
                            height: 200.r,
                            fit: BoxFit.cover,
                            imageUrl: '',
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: 100.r,
                              backgroundColor: Colors.grey[200],
                              child: const Icon(
                                CupertinoIcons.person,
                                size: 80,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,

                  // Full Name Field
                  const CustomTextFieldLabel(
                    labelText: "Full Name*",
                    fontColor: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  8.verticalSpace,
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.sp,
                        vertical: 16.sp,
                      ),
                    ),
                    onChanged: (value) {
                      print("Full Name Updated: $value");
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,

                  // Email Field
                  const CustomTextFieldLabel(
                    labelText: "Email*",
                    fontColor: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  8.verticalSpace,
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.sp,
                        vertical: 16.sp,
                      ),
                    ),
                    onChanged: (value) {
                      print("Email Updated: $value");
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  40.verticalSpace,

                  // Update Button
                  CustomElevatedButton(
                    onPressed: () => _handleUpdateProfile(viewModel),
                    text: "Save Changes",
                    icon: Icons.save,
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
          );
        },
      ),
    );
  }
}
