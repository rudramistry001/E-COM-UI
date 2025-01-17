import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com_ui/dashboard/models/product_model.dart';
import 'package:e_com_ui/dashboard/widgets/product_carousel.dart';
import 'package:e_com_ui/screens/home/widgets/search_bar.dart';
import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration _remainingTime = const Duration(hours: 11, minutes: 15, seconds: 4);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > Duration.zero) {
        // Update state to reflect time changes
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      } else {
        // Stop the timer when time runs out
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List<String> recentSearches = [];
  TextEditingController searchController = TextEditingController();

  // List of image URLs (fetched from backend)
  List<String> imageUrls = [
    "https://i.imghippo.com/files/lLo9557mPE.png",
    "https://i.imghippo.com/files/QgfB3788Tc.png",
    "https://i.imghippo.com/files/vhLV6311Gf.png",
    "https://i.imghippo.com/files/vhLV6311Gf.png",
    "https://i.imghippo.com/files/Kgcp3090nXo.png",
  ];

  // List of products
  final products = [
    Product(
        name: "IPhones",
        imageUrl: "https://i.imghippo.com/files/MnG9652QpQ.png",
        price: 29.99),
    Product(
        name: "Laptops",
        imageUrl: "https://i.imghippo.com/files/G4076eo.png",
        price: 19.99),
    Product(
        name: "Sneakers",
        imageUrl: "https://i.imghippo.com/files/DAi5219qOc.png",
        price: 39.99),
    Product(
        name: "BLuetooth Speakers",
        imageUrl: "https://i.imghippo.com/files/CjHs7649tts.png",
        price: 49.99),
    // Add more products as needed
  ];

  int _currentIndex = 0; // Current index for the active image in the carousel

 

  @override
  Widget build(BuildContext context) {
    final hours = _remainingTime.inHours.toString().padLeft(2, '0');
    final minutes = (_remainingTime.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime.inSeconds % 60).toString().padLeft(2, '0');
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
        onRefresh: _refreshContent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomSearchHome(),
            Padding(  
              padding:  EdgeInsets.all(16.0.sp),
              child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
                children: [// Custom Carousel Slider Section
                const CustomText(
                  text: "Exclusive Offers",
                  color: Colors.black,
                  textType: TextType.title,
                  textWeight: TextWeight.semiBold,
                ),
                10.verticalSpace,
                SizedBox(
                  height: 200.h, // Adjust height as needed
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // PageView for carousel
                      PageView.builder(
                        itemCount: imageUrls.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: CachedNetworkImage(
                                imageUrl: imageUrls[index],
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error, color: Colors.red),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                        
                      // Dots Indicator
                      Positioned(
                        bottom: 10.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            imageUrls.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              width: _currentIndex == index ? 12.w : 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.blue
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                        
                // Offers Section (Deal of the Day)
                const CustomText(
                  text: "Deal of the Day",
                  color: Colors.black,
                  textType: TextType.bodyLarge,
                  textWeight: TextWeight.regular,
                ),
                10.verticalSpace,
                Container(
                  height: 60.sp,
                  width: 180.sp,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTimeBox(hours, "HRS"),
                      10.horizontalSpace,
                      _buildTimeBox(minutes, "MIN"),
                      10.horizontalSpace,
                      _buildTimeBox(seconds, "SEC"),
                    ],
                  ),
                ),
                10.verticalSpace,
                // Product Carousel Section
                ProductCarousel(products: products),
                Text(
                  "Eat what makes you happy",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace, // Space before ProductCarousel
                        
                100.verticalSpace, // Optional space at the end],)
                
              ],
                        ),
            ),
            ]
          ),
        ),
      ),
    );
  }

  Future<void> _refreshContent() async {
    imageUrls.shuffle();
    products.shuffle();
    await Future.delayed(const Duration(seconds: 1));
  }

  // Helper method to build a time box
  Widget _buildTimeBox(String time, String label) {
    return Row(
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
