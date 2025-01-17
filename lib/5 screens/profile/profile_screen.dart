// import 'package:e_com_ui/screens/profile/address_screen.dart';
// import 'package:e_com_ui/screens/profile/widgets/custom_divider.dart';
// import 'package:e_com_ui/screens/profile/widgets/profile_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0.sp),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               40.verticalSpace,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: CircleAvatar(
//                       radius: 60.r,
//                       backgroundImage: const AssetImage(
//                           'assets/images/profile.png'), // Replace with your image asset
//                     ),
//                   ),
//                   10.horizontalSpace,
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       "Rudra Mistry",
//                       style: TextStyle(
//                         fontFamily: "Metrophobic",
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   5.verticalSpace,
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       "mistryrudra@yahoo.com",
//                       style: TextStyle(
//                         fontFamily: "Metrophobic",
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w100,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               10.verticalSpace,
//               CustomLineDivider(
//                 thickness: 2.0,
//                 color: Colors.grey.shade300,
//                 indent: 0.0,
//                 endIndent: 0.0,
//               ),
//               CustomProfileText(
//                 text: "Manage Your Profile",
//                 onTap: () {},
//                 icon: Icons.person_outlined,
//               ),
//               CustomLineDivider(
//                 thickness: 2.0,
//                 color: Colors.grey.shade300,
//                 indent: 0.0,
//                 endIndent: 0.0,
//               ),
//               10.verticalSpace,
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "FOOD ORDERS",
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontFamily: "Metrophobic",
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               10.verticalSpace,
//               CustomProfileText(
//                 text: "Your Orders",
//                 onTap: () {
//                   // Handle tap action here
//                 },
//                 icon: Icons.receipt_long_outlined,
//               ),
//               CustomProfileText(
//                 text: "Favorite Orders",
//                 onTap: () {
//                   // Handle tap action here
//                 },
//                 icon: Icons.favorite_outlined,
//               ),
//               CustomProfileText(
//                 text: "Address Book",
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const AddressScreen()),
//                   );
//                 },
//                 icon: Icons.book_outlined,
//               ),
//               CustomProfileText(
//                 text: "Online Ordering Help",
//                 onTap: () {
//                   // Handle tap action here
//                 },
//                 icon: Icons.message_outlined,
//               ),
//               CustomLineDivider(
//                 thickness: 2.0,
//                 color: Colors.grey.shade300,
//                 indent: 0.0,
//                 endIndent: 0.0,
//               ),
//               CustomProfileText(
//                 text: "About",
//                 onTap: () {},
//                 icon: Icons.info_outline,
//               ),c
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
