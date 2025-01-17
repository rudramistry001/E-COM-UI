
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAddressCard extends StatelessWidget {
  final String label;
  final String detail;
  final bool isSelected;
  final bool isDefault;
  final VoidCallback onSelected;

  const SelectAddressCard({
    super.key,
    required this.label,
    required this.detail,
    required this.isSelected,
    required this.isDefault,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: isSelected ? Colors.blue : Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                size: 30.sp,
                Icons.location_on_outlined,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: label,
                          textType: TextType.bodyLarge,
                          textWeight: TextWeight.bold,
                          color: Colors.black,
                        ),
                        10.horizontalSpace,
                        // Display "Default" badge based on isDefault property
                        if (isDefault)
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const CustomText(
                                text: "Default",
                                textType: TextType.caption,
                                textWeight: TextWeight.light,
                                color: Colors.black,
                              )),
                      ],
                    ),
                    10.horizontalSpace,
                    5.verticalSpace,
                    Text(
                      detail,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Radio<String>(
                value: label,
                groupValue: isSelected ? label : null,
                onChanged: (value) => onSelected(),
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
