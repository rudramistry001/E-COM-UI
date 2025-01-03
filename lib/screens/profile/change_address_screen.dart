import 'package:e_com_ui/screens/profile/edit_address_screen.dart';
import 'package:e_com_ui/screens/profile/widgets/address_card.dart';
import 'package:e_com_ui/widgets/custom_app_bar.dart';
import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appbartext: "MANAGE ADDRESSES", // Pass the desired app bar title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "SAVED ADDRESSES",
                    textType: TextType.bodyLarge,
                    textWeight: TextWeight.regular,
                    color: Colors.black,
                  )),
              20.verticalSpace,
              AddressCard(
                title: 'Home',
                address:
                    'Road 39, Block 28, Sector-24, Rohini, Delhi, 110085, India',
                onEditPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditAddressScreen()),
                  );
                },
                onDeletePressed: () {
                  // Handle delete action
                  print('Delete button pressed');
                },
              ),
              AddressCard(
                title: 'Office',
                address:
                    'Sarabhai Campus,Alkapuri Road,Vadodara,Gujarat,390007, India',
                onEditPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditAddressScreen()),
                  );
                },
                onDeletePressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
