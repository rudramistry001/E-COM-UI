import 'package:e_com_ui/dashboard/notification/widgets/notification_card.dart';
import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List of Notifications
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Your Coins are Expiring!',
      'subtitle': 'Use them to grab all your favorite products.',
      'timeAgo': '2 days ago',
      'isDiscountNotification': false,
    },
    {
      'title': 'Atta, Rice, Oil...Up to 50% Off!',
      'subtitle':
          'No min. order value! Avail free shipping.Wireless, wired, in-ear, on-ear, noise cancellation.',
      'timeAgo': '3 days ago',
      'isDiscountNotification': true,
    },
    {
      'title': 'Up to 60% Off | Headphones & Earphones',
      'subtitle':
          'Wireless, wired, in-ear, on-ear, noise cancellation.Wireless, wired, in-ear, on-ear, noise cancellation.',
      'timeAgo': '6 days ago',
      'isDiscountNotification': true,
    },
    {
      'title': 'Up to 60% Off | Headphones & Earphones',
      'subtitle':
          'Wireless, wired, in-ear, on-ear, noise cancellation.Wireless, wired, in-ear, on-ear, noise cancellation.',
      'timeAgo': '6 days ago',
      'isDiscountNotification': true,
    },
    {
      'title': 'Up to 60% Off | Headphones & Earphones',
      'subtitle':
          'Wireless, wired, in-ear, on-ear, noise cancellation.Wireless, wired, in-ear, on-ear, noise cancellation.',
      'timeAgo': '6 days ago',
      'isDiscountNotification': true,
    },
    {
      'title': 'Up to 60% Off | Headphones & Earphones',
      'subtitle': 'Wireless, wired, in-ear, on-ear, noise cancellation.',
      'timeAgo': '6 days ago',
      'isDiscountNotification': true,
    },
    {
      'title': 'Up to 60% Off | Headphones & Earphones',
      'subtitle': 'Wireless, wired, in-ear, on-ear, noise cancellation.',
      'timeAgo': '6 days ago',
      'isDiscountNotification': true,
    },
  ];

  // Filter State
  String selectedFilter = 'All'; // Default filter

  // Filtered Notifications
  List<Map<String, dynamic>> get filteredNotifications {
    if (selectedFilter == 'Offers') {
      return notifications
          .where((notification) => notification['isDiscountNotification'])
          .toList();
    }
    return notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CustomText(
              text: 'Notifications',
              color: Colors.black,
              textType: TextType.title,
              textWeight: TextWeight.regular,
            ),
            5.horizontalSpace,
            const CustomText(
              text: '(3)',
              color: Colors.black,
              textType: TextType.title,
              textWeight: TextWeight.regular,
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.verticalSpace,
            // Filter Buttons
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterButton(
                    title: 'All',
                    isSelected: selectedFilter == 'All',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'All';
                      });
                    },
                  ),
                  SizedBox(width: 8.w),
                  FilterButton(
                    title: 'Offers',
                    isSelected: selectedFilter == 'Offers',
                    svgIconPath:
                        'assets/icons/discount.svg', // Path to the SVG icon
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Offers';
                      });
                    },
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            // Notification List
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  200.h, // Adjust height dynamically
              child: ListView.builder(
                padding:
                    EdgeInsets.zero, // Remove all padding around the ListView
                itemCount: filteredNotifications.length,
                itemBuilder: (context, index) {
                  final notification = filteredNotifications[index];
                  return NotificationCard(
                    title: notification['title'],
                    subtitle: notification['subtitle'],
                    timeAgo: notification['timeAgo'],
                    isDiscountNotification:
                        notification['isDiscountNotification'],
                    trailingImage: notification['trailingImage'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final String? svgIconPath; // Add an optional SVG icon path

  const FilterButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.shade100
              : Colors.white, // Background color
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Adjust size based on content
          children: [
            // Text
            CustomText(
              text: title,
              textType: TextType.bodySmall,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            if (svgIconPath != null) ...[
              SizedBox(width: 8.w), // Spacing between text and icon
              SvgPicture.asset(
                svgIconPath!,
                color:
                    isSelected ? Colors.blue : Colors.grey, // Match icon color
                height: 16.h,
                width: 16.w,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
