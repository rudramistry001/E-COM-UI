import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String dealText;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.dealText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w, // Responsive width using ScreenUtil
      padding: EdgeInsets.all(8.w), // Responsive padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r), // Responsive border radius
        color: Colors.white,
        boxShadow: const [], // No shadow
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Customizable Image
          ClipRRect(
            borderRadius:
                BorderRadius.circular(15.r), // Responsive border radius
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 100.h, // Responsive height for the image
            ),
          ),
          SizedBox(height: 8.h), // Responsive space
          // Customizable Product Name
          CustomText(
            text: productName,
            textType: TextType.bodySmall,
            textWeight: TextWeight.regular,
          ),
          SizedBox(height: 4.h), // Responsive space
          // Customizable Deal Text
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w, // Responsive horizontal padding
              vertical: 6.h, // Responsive vertical padding
            ),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius:
                  BorderRadius.circular(12.r), // Responsive border radius
            ),
            child: Text(
              dealText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp, // Responsive font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<ProductCard> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products
            .map((product) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: product,
                ))
            .toList(),
      ),
    );
  }
}
