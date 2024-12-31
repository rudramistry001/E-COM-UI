import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // To use sp for scaling

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownvalue;
  final List<String> items = [
    'Andhra Pradesh',
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
        title: const Text('Custom Dropdown'),
      ),
      body: Center(
        child: Container(
          width: 360.sp, // Set width as per the requirement
          height: 50.sp, // Set height as per the requirement
          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0.sp),
          ),
          child: DropdownButton<String>(
            isExpanded: true, // Makes sure the dropdown fills the container
            hint: const Text('Select a state'),
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            style:
                TextStyle(color: Colors.black, fontSize: 16.sp), // Text styling
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
