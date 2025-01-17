import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              CachedNetworkImage(
                imageUrl: "https://via.placeholder.com/400",
                placeholder: (context, url) => Container(
                  height: 250,
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),

              // Product Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Calvin Klein Regular fit slim fit shirt',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),

              // Rating and Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '4.1',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.star, color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('87 Reviews'),
                    const Spacer(),
                    const Text(
                      '\$35',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '\$48.35',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '15% OFF',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Color Variants
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Color: White',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CachedNetworkImage(
                        imageUrl: "https://via.placeholder.com/50",
                        placeholder: (context, url) => Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey[300],
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),

              // Sizes
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Size: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Only 5 Left',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(size),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // Delivery Info
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Deliver to',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          'Change',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Maine Inglewood - 98380',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Get it by Wed, Feb 02',
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(height: 4),
                    Text('COD Available'),
                    SizedBox(height: 4),
                    Text('30 Days Exchange/Return Available'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Product Details
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Product Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fabric - Cotton'),
                    Text('Length - Regular'),
                    Text('Neck - Round Neck'),
                    Text('Pattern - Graphic Print'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
