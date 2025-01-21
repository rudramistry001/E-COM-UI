import 'package:e_com_ui/5%20screens/auth/widgets/custom_textfield.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_app_bar.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_elevated_button.dart';
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  bool isHouseNoValid = false;
  bool isNearestLandmarkValid = false;
  bool isAreaValid = false;
  bool isZipCodeValid = false;
  bool isCityValid = false;
  bool isCustomerNameValid = false;
  bool isCustomerNoValid = false;
  bool _isChecked = false;

  TextEditingController housenoController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController zipocodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController customernameController = TextEditingController();
  TextEditingController contactnoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    housenoController.dispose();
    landmarkController.dispose();
    areaController.dispose();
    zipocodeController.dispose();
    cityController.dispose();
    customernameController.dispose();
    contactnoController.dispose();
  }

  // Initial Selected Value
  String dropdownvalue = '';
  // List of items in our dropdown menu
  var items = [
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi',
    'Jammu and Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appbartext: "ADD NEW ADDRESS"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              20.verticalSpace,
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "ADDRESS DETAILS",
                  textType: TextType.bodyLarge,
                  textWeight: TextWeight.regular,
                  color: Colors.black,
                ),
              ),
              10.verticalSpace,
              20.verticalSpace,
              CustomStyledTextField(
                controller: housenoController,
                keyboardType: TextInputType.name,
                hintText: "House/Flat Number*",

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'This is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isHouseNoValid = isValid;
                  });
                },
                errorText: isHouseNoValid
                    ? null
                    : 'House Number is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              CustomStyledTextField(
                controller: landmarkController,
                keyboardType: TextInputType.name,
                hintText: "Nearest Landmark*",

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Landmark is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isNearestLandmarkValid = isValid;
                  });
                },
                errorText: isNearestLandmarkValid
                    ? null
                    : 'Landmark is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              CustomStyledTextField(
                controller: areaController,
                keyboardType: TextInputType.name,
                hintText: "Area*",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'This is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isAreaValid = isValid;
                  });
                },
                errorText: isAreaValid
                    ? null
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              CustomStyledTextField(
                controller: zipocodeController,
                keyboardType: TextInputType.phone,
                hintText: "ZIP Code* ",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'This is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isZipCodeValid = isValid;
                  });
                },
                errorText: isZipCodeValid
                    ? null
                    : 'Zip Code is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              CustomStyledTextField(
                controller: cityController,
                keyboardType: TextInputType.phone,
                hintText: "City*",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'City Name is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isCityValid = isValid;
                  });
                },
                errorText: isCityValid
                    ? null
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              Container(
                width: 360.w,
                height: 50.h,
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w), // Responsive padding
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey, width: 1), // Grey border
                  borderRadius:
                      BorderRadius.circular(5.r), // Responsive border radius
                ),
                child: Material(
                  color: Colors
                      .transparent, // Remove the dropdown's internal background
                  child: Center(
                    child: DropdownButton<String>(
                      value: dropdownvalue.isEmpty
                          ? null
                          : dropdownvalue, // Initial value: null if empty
                      hint: Text(
                        'Select a State',
                        style: TextStyle(
                          fontFamily: "Metrophobic",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ), // Display 'Select a State' as a placeholder
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24, // Adjust the icon size
                      isExpanded: true, // Make dropdown fill the container
                      underline: const SizedBox(), // Remove underline
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue =
                              newValue!; // Update the selected value
                        });
                      },
                      selectedItemBuilder: (BuildContext context) {
                        return items.map<Widget>((String item) {
                          return Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                      iconEnabledColor:
                          Colors.black, // Set the color of the arrow icon
                      dropdownColor:
                          Colors.white, // Customize dropdown color if needed
                      isDense: true, // Reduce space inside the button
                      itemHeight: 48, // Adjust dropdown menu item height
                    ),
                  ),
                ),
              ),
// CONTACT DETAILS PART
              20.verticalSpace,
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "ADDRESS DETAILS",
                  textType: TextType.bodyLarge,
                  textWeight: TextWeight.regular,
                  color: Colors.black,
                ),
              ),
              10.verticalSpace,
              20.verticalSpace,
              CustomStyledTextField(
                controller: customernameController,
                keyboardType: TextInputType.name,
                hintText: "Customer Name*",

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'This is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isCustomerNameValid = isValid;
                  });
                },
                errorText: isCustomerNameValid
                    ? null
                    : 'House Number is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              CustomStyledTextField(
                controller: contactnoController,
                keyboardType: TextInputType.phone,
                hintText: "Customer Contact No*",

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'This is a required field'; // Validation: must not be empty
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isCustomerNoValid = isValid;
                  });
                },
                errorText: isCustomerNoValid
                    ? null
                    : 'Contact Number is a required field', // Show error when invalid
              ),
              20.verticalSpace,

              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  const CustomText(
                    text: "Use as Default Address",
                    textType: TextType.bodySmall,
                    textWeight: TextWeight.regular,
                    color: Colors.black,
                  ),
                ],
              ),
              10.verticalSpace,
              CustomElevatedButton(
                onPressed: () {},
                text: "Save Address",
                height: 50.sp,
                width: double.infinity,
                backgroundColor: Colors.blue,
                borderColor: Colors.blue,
                borderWidth: 1,
                textColor: Colors.white,
                iconColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
