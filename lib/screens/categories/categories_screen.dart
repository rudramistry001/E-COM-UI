// category_item.dart
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;

  const CategoryItem({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// product_card.dart
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
              // Placeholder for loading and errors
              errorBuilder: (context, error, stackTrace) => Container(
                height: 120,
                width: 120,
                color: Colors.grey[200],
                child: const Icon(Icons.image),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// recently_viewed_item.dart
class RecentlyViewedItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecentlyViewedItem({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 100,
                width: 100,
                color: Colors.grey[200],
                child: const Icon(Icons.image),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// home_screen.dart
class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryItem(iconPath: 'assets/emi.png', label: 'EMI'),
                  SizedBox(width: 16),
                  CategoryItem(
                      iconPath: 'assets/group.png', label: 'Group Buy'),
                  SizedBox(width: 16),
                  CategoryItem(iconPath: 'assets/fire.png', label: 'FireDrops'),
                  SizedBox(width: 16),
                  CategoryItem(iconPath: 'assets/camera.png', label: 'Camera'),
                  SizedBox(width: 16),
                  CategoryItem(
                      iconPath: 'assets/seller.png', label: 'Seller Hub'),
                ],
              ),
            ),
          ),

          // Products Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  ProductCard(
                    imageUrl: 'https://placeholder.com/deals1',
                    title: 'Grab Deals',
                    subtitle: 'Extra ₹75 Off*',
                  ),
                  ProductCard(
                    imageUrl: 'https://placeholder.com/fashion1',
                    title: 'Metronaut Roadster',
                    subtitle: '60-80% Off',
                  ),
                  ProductCard(
                    imageUrl: 'https://placeholder.com/electronics1',
                    title: '48H | Quad Mic',
                    subtitle: 'Just ₹999',
                  ),
                ],
              ),
            ),
          ),

          // Recently Viewed Section
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Text(
              'Recently Viewed Stores',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  RecentlyViewedItem(
                    imageUrl: 'https://placeholder.com/earphones',
                    title: 'Wired Earphones',
                  ),
                  RecentlyViewedItem(
                    imageUrl: 'https://placeholder.com/gaming',
                    title: 'Other Platforms',
                  ),
                  RecentlyViewedItem(
                    imageUrl: 'https://placeholder.com/webcams',
                    title: 'Webcams',
                  ),
                  RecentlyViewedItem(
                    imageUrl: 'https://placeholder.com/computers',
                    title: 'Computers',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
