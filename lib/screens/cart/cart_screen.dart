import 'package:e_com_ui/screens/cart/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CartCard(
                imageUrl:
                    'https://i.imghippo.com/files/MnG9652QpQ.png', // Replace with your image URL
                productName: 'Allen Solly Regular fit cotton shirt',
                currentPrice: 35.0,
                originalPrice: 40.25,
                discountPercentage: 15,
                size: 'L',
                quantity: 1,
                onRemove: () {
                  // Handle remove
                },
                onIncrement: () {
                  // Handle increment
                },
                onDecrement: () {
                  // Handle decrement
                },
              ),
              10.verticalSpace,
              CartCard(
                imageUrl:
                    'https://i.imghippo.com/files/MnG9652QpQ.png', // Replace with your image URL
                productName: 'Allen Solly Regular fit cotton shirt',
                currentPrice: 35.0,
                originalPrice: 40.25,
                discountPercentage: 15,
                size: 'L',
                quantity: 1,
                onRemove: () {
                  // Handle remove
                },
                onIncrement: () {
                  // Handle increment
                },
                onDecrement: () {
                  // Handle decrement
                },
              ),
              10.verticalSpace,
              CartCard(
                imageUrl:
                    'https://i.imghippo.com/files/MnG9652QpQ.png', // Replace with your image URL
                productName: 'Allen Solly Regular fit cotton shirt',
                currentPrice: 35.0,
                originalPrice: 40.25,
                discountPercentage: 15,
                size: 'L',
                quantity: 1,
                onRemove: () {
                  // Handle remove
                },
                onIncrement: () {
                  // Handle increment
                },
                onDecrement: () {
                  // Handle decrement
                },
              ),
              CartCard(
                imageUrl:
                    'https://i.imghippo.com/files/MnG9652QpQ.png', // Replace with your image URL
                productName: 'Allen Solly Regular fit cotton shirt',
                currentPrice: 35.0,
                originalPrice: 40.25,
                discountPercentage: 15,
                size: 'L',
                quantity: 1,
                onRemove: () {
                  // Handle remove
                },
                onIncrement: () {
                  // Handle increment
                },
                onDecrement: () {
                  // Handle decrement
                },
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
