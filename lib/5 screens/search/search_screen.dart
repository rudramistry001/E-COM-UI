// search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> popularSearches = [
      'Jeans',
      'Casual clothes',
      'Hoodie',
      'Nike shoes black',
      'V-neck tshirt',
      'Winter clothes',
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 24.w),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const CustomSearchBar(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Searches',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle clear all
                    },
                    child: Text(
                      'Clear All',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  itemCount: popularSearches.length,
                  itemBuilder: (context, index) {
                    return PopularSearchItem(
                      searchTerm: popularSearches[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// custom_search_bar.dart
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 20.w,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Find your favorite items',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey[600],
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}

// popular_search_item.dart
class PopularSearchItem extends StatelessWidget {
  final String searchTerm;

  const PopularSearchItem({
    super.key,
    required this.searchTerm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            searchTerm,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          Icon(
            Icons.close,
            size: 18.w,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}

// main.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X dimensions as base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Search Screen',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SearchScreen(),
        );
      },
    );
  }
}
