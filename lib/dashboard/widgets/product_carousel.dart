import 'package:e_com_ui/dashboard/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h, // Adjust the height of the carousel
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SizedBox(
              width: 150.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image Carousel (Displaying single image)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      product.imageUrl.isNotEmpty
                          ? product.imageUrl // Display the single image
                          : 'https://via.placeholder.com/150',
                      height: 140.h,
                      width: 140.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Product Name
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.h),
                  // Product Price
                  Text(
                    '(${product.price}% off)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
