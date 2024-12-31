import 'package:e_com_ui/screens/profile/widgets/custom_divider.dart';
import 'package:e_com_ui/screens/profile/widgets/custom_textfield.dart';
import 'package:e_com_ui/screens/profile/widgets/custom_textfield_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  bool isHouseNoValid = false;
  bool isContactNumberValid = false;

  TextEditingController housenoController = TextEditingController();
  TextEditingController contactnoController = TextEditingController();
  TextEditingController landmarkcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    housenoController.dispose();
    contactnoController.dispose();
    landmarkcontroller.dispose();
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
      appBar: AppBar(
        title: Text(
          "EDIT ADDRESS",
          style: TextStyle(
              fontFamily: "Metrophobic",
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PERSONAL DETAILS",
                  style: TextStyle(
                      fontFamily: "Metrophobic",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              20.verticalSpace,
              const CustomTextFieldLabel(
                labelText: "Full Name*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: housenoController,
                keyboardType: TextInputType.name,
                hintText: "Ex: John Doe",
                prefixIcon: const Icon(Icons.person),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Full Name is a required field'; // Validation: must not be empty
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
                    : 'Full Name is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              const CustomTextFieldLabel(
                labelText: "Contact Number*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),

              // Mobile Number field with validation
              CustomStyledTextField(
                hintText: "Enter your contact number",
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                controller: contactnoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Contact number is required";
                  } else if (value.length < 10 ||
                      !RegExp(r'^\d+$').hasMatch(value)) {
                    return "Mobile number must be at least 10 digits";
                  } else if (value.length > 10 ||
                      !RegExp(r'^\d+$').hasMatch(value)) {
                    return "Mobile number must be of only 10 digits";
                  }
                  return null;
                },
                onValidationChanged: (isValid) {
                  setState(() {
                    isContactNumberValid = isValid;
                  });
                },
                errorText: isContactNumberValid
                    ? null
                    : "Mobile number must be at least 10 digits",
              ),
              20.verticalSpace,
              CustomLineDivider(
                thickness: 2.0,
                color: Colors.grey.shade300,
                indent: 0.0,
                endIndent: 0.0,
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ADDRESS DETAILS",
                  style: TextStyle(
                    fontFamily: "Metrophobic",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                                fontFamily: "Metrophobic",
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
                              fontFamily: "Metrophobic",
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
              const CustomTextFieldLabel(
                labelText: "House/Flat Number*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: housenoController,
                keyboardType: TextInputType.name,
                hintText: "Ex: ",
                prefixIcon: const Icon(Icons.person),
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
              const CustomTextFieldLabel(
                labelText: "Nearest Landmark*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: landmarkcontroller,
                keyboardType: TextInputType.name,
                hintText: "Ex: ",
                prefixIcon: const Icon(Icons.person),
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
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              const CustomTextFieldLabel(
                labelText: "Area*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: landmarkcontroller,
                keyboardType: TextInputType.name,
                hintText: "Ex: ",
                prefixIcon: const Icon(Icons.person),
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
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              const CustomTextFieldLabel(
                labelText: "ZIP Code*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: landmarkcontroller,
                keyboardType: TextInputType.phone,
                hintText: "Ex: ",
                prefixIcon: const Icon(Icons.person),
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
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              const CustomTextFieldLabel(
                labelText: "Area*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: landmarkcontroller,
                keyboardType: TextInputType.name,
                hintText: "Ex: ",
                prefixIcon: const Icon(Icons.person),
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
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
              const CustomTextFieldLabel(
                labelText: "Area*",
                fontColor: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              CustomStyledTextField(
                controller: landmarkcontroller,
                keyboardType: TextInputType.name,
                hintText: "Ex: ",
                prefixIcon: const Icon(Icons.person),
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
                    : 'This is a required field', // Show error when invalid
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}