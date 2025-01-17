
import 'package:e_com_ui/5%20screens/profile/edit_address_screen.dart';
import 'package:e_com_ui/5%20screens/profile/widgets/select_address_card.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_app_bar.dart';
import 'package:e_com_ui/6%20global%20widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  String selectedAddress = 'Home'; // Default selected address

  final List<Map<String, dynamic>> addresses = [
    {
      'label': 'Home',
      'detail': '925 S Chugach St #APT 10, Alaska',
      'isDefault': false,
    },
    {
      'label': 'Office',
      'detail': '2438 6th Ave, Ketchikan, Alaska 99901',
      'isDefault': true,
    },
    {
      'label': 'Apartment',
      'detail': '2551 Vista Dr #B301, Juneau, Alaska',
      'isDefault': false,
    },
    {
      'label': 'Parent’s House',
      'detail': '4821 Ridge Top Cir, Anchorage, Alaska',
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appbartext: "MANAGE ADDRESSES", // Pass the desired app bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return SelectAddressCard(
                    label: address['label']!,
                    detail: address['detail']!,
                    isDefault: address['isDefault'] ?? false,
                    isSelected: selectedAddress == address['label'],
                    onSelected: () {
                      setState(() {
                        selectedAddress = address['label']!;
                      });
                    },
                  );
                },
              ),
            ),
            30.verticalSpace,
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditAddressScreen()),
                );
              },
              text: "Add New Address",
              icon: Icons.add,
              height: 50.sp,
              width: double.infinity,
              backgroundColor: Colors.white,
              borderColor: Colors.blue,
              borderWidth: 1,
              textColor: Colors.blue,
              iconColor: Colors.blue,
            ),
            10.verticalSpace,
            CustomElevatedButton(
              onPressed: () {},
              text: "Apply",
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
    );
  }
}
