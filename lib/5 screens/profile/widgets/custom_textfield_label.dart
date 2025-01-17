
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:flutter/material.dart';

class CustomTextFieldLabel extends StatelessWidget {
  final String? labelText;
  final FontWeight? fontWeight;
  final Color? fontColor;

  const CustomTextFieldLabel({
    super.key,
    this.labelText,
    this.fontWeight,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      alignment: Alignment.centerLeft,
      child: CustomText(
        text: labelText ?? '',
        textType: TextType.bodyLarge,
        textWeight: TextWeight.regular,
        color: fontColor ?? Colors.black,
      ),
    );
  }
}
