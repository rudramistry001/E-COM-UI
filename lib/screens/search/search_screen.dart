import 'package:e_com_ui/screens/search/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List to store recent searches
  List<String> recentSearches = [];

  // Controller for the search input
  TextEditingController searchController = TextEditingController();

  // Method to handle search input changes
  void _onSearchChanged(String value) {
    setState(() {
      if (value.isNotEmpty && !recentSearches.contains(value)) {
        recentSearches.insert(0, value); // Add new search term to the top
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: [
            30.verticalSpace,
            CustomSearchField(
              controller: searchController,
              hintText: 'Search . . .',
              onChanged: _onSearchChanged,
            ),
            20.verticalSpace, // Space between search field and recent searches
            // Display recent searches

            // Optional: Show a message if no recent searches
            if (recentSearches.isEmpty)
              Center(
                child: Text(
                  'No recent searches',
                  style: TextStyle(
                    fontFamily: "Metrophobic",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
