import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double currentPrice;
  final double originalPrice;
  final int discountPercentage;
  final String size;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
    required this.discountPercentage,
    required this.size,
    required this.quantity,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.all(8.w), // responsive margin
      child: Padding(
        padding: EdgeInsets.all(16.w), // responsive padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.w), // responsive border radius
              child: Image.network(
                imageUrl,
                width: 80.sp, // responsive width and height
                height: 80.sp,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w), // responsive spacing
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 16.sp, // responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // responsive height
                  Row(
                    children: [
                      Text(
                        '\$$currentPrice',
                        style: TextStyle(
                          fontSize: 16.sp, // responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 8.w), // responsive spacing
                      Text(
                        '\$$originalPrice',
                        style: TextStyle(
                          fontSize: 14.sp, // responsive font size
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8.w), // responsive spacing
                      Text(
                        '$discountPercentage% OFF',
                        style: TextStyle(
                          fontSize: 14.sp, // responsive font size
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h), // responsive height
                  Row(
                    children: [
                      // Size Dropdown
                      DropdownButton<String>(
                        value: size,
                        items: ['S', 'M', 'L', 'XL']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(width: 16.w), // responsive spacing
                      // Quantity Controls
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove,
                                size: 20.sp), // responsive icon size
                            onPressed: onDecrement,
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                                fontSize: 16.sp), // responsive font size
                          ),
                          IconButton(
                            icon: Icon(Icons.add,
                                size: 20.sp), // responsive icon size
                            onPressed: onIncrement,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Remove Button
            IconButton(
              icon: Icon(Icons.delete,
                  color: Colors.red, size: 24.sp), // responsive icon size
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
