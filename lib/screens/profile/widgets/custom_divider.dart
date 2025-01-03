import 'package:flutter/material.dart';

class CustomLineDivider extends StatelessWidget {
  final double thickness;

  final double indent;
  final double endIndent;

  const CustomLineDivider({
    super.key,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: Colors.grey.shade300,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
