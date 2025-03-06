// import 'package:flutter/material.dart';
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: AppColors.backgroundColor,
//         appBar: AppBar(
//           backgroundColor: AppColors.backgroundColor,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Hi! Gulnoza",
//                 style: TextStyle(color: AppColors.textColor, fontSize: 25),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: AppColors.pinkColor),
//                     child: const Padding(
//                       padding: EdgeInsets.all(4.0),
//                       child: Icon(
//                         Icons.notifications,
//                         color: AppColors.textColor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: AppColors.pinkColor),
//                     child: const Padding(
//                       padding: EdgeInsets.all(4.0),
//                       child: Icon(
//                         Icons.search,
//                         color: AppColors.textColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 16, right: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "What are you cooking today",
//                       style:
//                           TextStyle(color: AppColors.whiteColor, fontSize: 13),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: AppColors.pinkColor,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.all(2.0),
//                               child: Text(
//                                 "Breakfast",
//                                 style: TextStyle(
//                                     color: AppColors.whiteColor, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: AppColors.pinkColor,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.all(2.0),
//                               child: Text(
//                                 "Breakfast",
//                                 style: TextStyle(
//                                     color: AppColors.whiteColor, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: AppColors.pinkColor,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.all(2.0),
//                               child: Text(
//                                 "Breakfast",
//                                 style: TextStyle(
//                                     color: AppColors.whiteColor, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: AppColors.pinkColor,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.all(2.0),
//                               child: Text(
//                                 "Breakfast",
//                                 style: TextStyle(
//                                     color: AppColors.whiteColor, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: AppColors.pinkColor,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.all(2.0),
//                               child: Text(
//                                 "Breakfast",
//                                 style: TextStyle(
//                                     color: AppColors.whiteColor, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     const Text(
//                       "Trending Recipe",
//                       style:
//                           TextStyle(color: AppColors.textColor, fontSize: 15),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Image.asset(AppImages.im1),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 255,
//                 decoration: BoxDecoration(
//                   color: AppColors.pinkColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Your Recipes",
//                         style: TextStyle(
//                             color: AppColors.whiteColor, fontSize: 15),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.vertical,
//                         child: Row(
//                           children: [
//                             Image.asset(AppImages.im2),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Image.asset(AppImages.im3),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Image.asset(AppImages.im2),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Top Chef",
//                       style: TextStyle(color: AppColors.textColor),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             Image.asset(AppImages.ch2),
//                             const Text(
//                               "Joseph",
//                               style: TextStyle(
//                                   color: AppColors.whiteColor, fontSize: 12),
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Image.asset(AppImages.ch1),
//                             const Text(
//                               "Andrew ",
//                               style: TextStyle(
//                                   color: AppColors.whiteColor, fontSize: 12),
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Image.asset(AppImages.ch3),
//                             const Text(
//                               "Emily",
//                               style: TextStyle(
//                                   color: AppColors.whiteColor, fontSize: 12),
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Image.asset(AppImages.ch4),
//                             const Text(
//                               "Jessica",
//                               style: TextStyle(
//                                   color: AppColors.whiteColor, fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Text(
//                       "Recently Added",
//                       style:
//                           TextStyle(color: AppColors.textColor, fontSize: 15),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset(AppImages.tos),
//                         Image.asset(AppImages.lim),
//                       ],
//                     ),
//                     // BottomNavigationBar()
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
