import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com_ui/4%20view%20model/offer_view_model.dart';
import 'package:e_com_ui/5%20screens/home/widgets/search_bar.dart';
import 'package:e_com_ui/6%20global%20widgets/text_wideget.dart';
import 'package:e_com_ui/1%20model/dashboard/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration _remainingTime = const Duration(hours: 11, minutes: 15, seconds: 4);
  late Timer _timer;

  List<String> imageUrls = []; // Initially empty list to hold image URLs

  @override
  void initState() {
    super.initState();
    _startTimer();
    _fetchOffers(); // Fetch offers when the screen is initialized
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > Duration.zero) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      } else {
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

  final products = [
    {"title": "Running Shoes", "discount": "Upto 40% OFF", "imageUrl": "https://i.imghippo.com/files/MnG9652QpQ.png"},
    {"title": "Sneakers", "discount": "40-60% OFF", "imageUrl": "https://i.imghippo.com/files/MnG9652QpQ.png"},
    {"title": "Wrist Watches", "discount": "Upto 40% OFF", "imageUrl": "https://i.imghippo.com/files/MnG9652QpQ.png"},
    {"title": "Bluetooth Speakers", "discount": "40-60% OFF", "imageUrl": "https://i.imghippo.com/files/MnG9652QpQ.png"},
  ];

  int _currentIndex = 0;

  Future<void> _fetchOffers() async {
    try {
      final offerModel = OfferModel(); // Pass any required data to your model
      await Provider.of<OfferViewModel>(context, listen: false).fetchOffers(context, offerModel);
    } catch (e) {
      print("Error while fetching offers: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    _remainingTime.inHours.toString().padLeft(2, '0');
    final minutes = (_remainingTime.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        color: Colors.blue,
        backgroundColor: Colors.grey.shade200,
        onRefresh: _refreshContent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomSearchHome(),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Custom Carousel Slider Section
                    const CustomText(
                      text: "Exclusive Offers",
                      color: Colors.black,
                      textType: TextType.title,
                      textWeight: TextWeight.semiBold,
                    ),
                    10.verticalSpace,
                    // Using Consumer to rebuild the widget when imageUrls are fetched
                    Consumer<OfferViewModel>(
                      builder: (context, offerViewModel, child) {
                        imageUrls = offerViewModel.getImageUrls ?? [];
                        return SizedBox(
                          height: 200.h, // Adjust height as needed
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              offerViewModel.isLoading
                                  ? const Center(child: CircularProgressIndicator())
                                  : PageView.builder(
                                      itemCount: imageUrls.length,
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(5.r),
                                          child: CachedNetworkImage(
                                            imageUrl: imageUrls[index],
                                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                            fit: BoxFit.fill,
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
                                        color: _currentIndex == index ? Colors.blue : Colors.grey,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refreshContent() async {
    print("Refreshing content...");
    // Trigger the API call again to refresh data
    await _fetchOffers();
  }
}
