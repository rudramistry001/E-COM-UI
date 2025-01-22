import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com_ui/5%20screens/auth/widgets/custom_textfield.dart';
import 'package:e_com_ui/5%20screens/auth/widgets/custom_textfield_label.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_app_bar.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isemailValid = true;
  bool isfullnameValid = true;
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  String? _image;
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    super.dispose();
    fullnamecontroller.dispose();
    emailcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appbartext: "Edit Profile"),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      //profile picture
                      _image != null
                          ?
                          //local image
                          Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.file(File(_image!),
                                    width: 200.r,
                                    height: 200.r,
                                    fit: BoxFit.cover),
                              ),
                            )
                          :
                          //placeholder image
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: CachedNetworkImage(
                                width: 200.r,
                                height: 200.r,
                                fit: BoxFit.cover,
                                imageUrl: 'https://via.placeholder.com/150',
                                errorWidget: (context, url, error) =>
                                    const CircleAvatar(
                                        child: Icon(CupertinoIcons.person)),
                              ),
                            ),

                      // edit image button
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MaterialButton(
                          elevation: 1,
                          onPressed: () {
                            _showBottomSheet();
                          },
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                20.verticalSpace,
                const CustomTextFieldLabel(
                  labelText: "Full Name*",
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                CustomStyledTextField(
                  controller: fullnamecontroller,
                  keyboardType: TextInputType.name,
                  hintText: "Your Name",

                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'This is a required field'; // Validation: must not be empty
                    }
                    return null;
                  },
                  onValidationChanged: (isValid) {
                    setState(() {
                      isfullnameValid = isValid;
                    });
                  },
                  errorText: isfullnameValid
                      ? null
                      : 'This is a required field', // Show error when invalid
                ),
                20.verticalSpace,
                const CustomTextFieldLabel(
                  labelText: "Email*",
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                CustomStyledTextField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.name,
                  hintText: "Your Email*",

                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'This is a required field'; // Validation: must not be empty
                    }
                    return null;
                  },
                  onValidationChanged: (isValid) {
                    setState(() {
                      isemailValid = isValid;
                    });
                  },
                  errorText: isemailValid
                      ? null
                      : 'This is a required field', // Show error when invalid
                ),
                40.verticalSpace,
                 CustomElevatedButton(
                onPressed: () {},
                text: "Update Profile",
                icon: Icons.file_upload_off,
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
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 30.h, bottom: 50.h),
            children: [
              //pick profile picture label
              const Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              //for adding some space
              SizedBox(height: 20.h),

              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(100.w, 100.h),
                    ),
                    onPressed: () {
                      // Placeholder for gallery button action
                    },
                    child: Image.asset('assets/images/images.png'),
                  ),

                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          fixedSize: Size(100.w, 100.h)),
                      onPressed: () {
                        // Placeholder for camera button action
                      },
                      child: Image.asset('assets/images/camera.png')),
                ],
              )
            ],
          );
        });
  }
}
