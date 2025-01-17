import 'package:e_com_ui/screens/search/search_screen.dart';
import 'package:e_com_ui/widgets/text_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomSearchHome extends StatelessWidget {
  const CustomSearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.sp,
      width: double.infinity,
      color: Colors.blue,
      child: Padding(
        padding:  EdgeInsets.all(16.0.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
        20.verticalSpace,
             const CustomSearchBar(),
              Row(
              children:  [
                 const CustomText(text: "Deliver to ",color: Colors.white,textType: TextType.bodySmall,textWeight: TextWeight.bold,),
                 5.horizontalSpace,
                 const CustomText(text: "Deliver to ",color: Colors.white,textType: TextType.bodySmall,textWeight: TextWeight.bold,),
              ],
             )
          ],
        ),
      ),
    );
  }
}