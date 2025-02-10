// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/controller/ratingcon.dart';
// import 'package:ecommerce/core/constans/constansappvalues.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/view/screens/reviewcommentspage.dart';
// import 'package:ecommerce/view/widget/giverewview.dart';
// import 'package:ecommerce/view/widget/productdetailwidgets/rating.dart';
// import 'package:ecommerce/view/widget/reviewcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ReviewPage extends StatelessWidget {
//   const ReviewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     Settingservices settingservices = Get.find();
//     Reviewsconimble reviewsconimble = Get.put(Reviewsconimble());
//     return GetBuilder<Reviewsconimble>(
//         builder: (reviewsconimble) => Scaffold(
//               appBar: AppBar(
//                 leading: IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: const Icon(Icons.arrow_back_ios),
//                 ),
//                 centerTitle: true,
//                 title: const Text(
//                   "Reviews & Ratings",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: screenWidth * .035),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20), // Add space at the top
//                       const Text(
//                         "Ratings and reviews are verified from people who are using the same application that you use.",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400, fontSize: 15),
//                       ),
//                       const SizedBox(height: 20), // Add space after the text
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 "4.5",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: screenWidth * 0.17,
//                                 ),
//                               ),
//                               RatingBarWidget(
//                                 readOnly: true,
//                                 starSize: 10,
//                                 Rating: 4.5,
//                                 onChanged: (double rating) {},
//                               ),
//                               Text(
//                                 "(12,512)",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 20),
//                           Expanded(
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   // Each star rating with a progress bar
//                                   RatingRow(starCount: 5, progress: 0.8),
//                                   RatingRow(starCount: 4, progress: 0.6),
//                                   RatingRow(starCount: 3, progress: 0.4),
//                                   RatingRow(starCount: 2, progress: 0.2),
//                                   RatingRow(starCount: 1, progress: 0.1),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GiveReview(onTap: () {
//                         Get.bottomSheet(GetBuilder<Reviewsconimble>(
//                             builder: (reviewsconimble) =>
//                                 ReviewCommentsPage()));
//                       }),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       RewiewCard(
//                         backgroundImage: CachedNetworkImageProvider(
//                             "${settingservices.sharedPref.get('photo')}"),
//                         username: "Ahmed Abdallah",
//                         Rating: 5,
//                         Reviewdate: "  10/10/2024",
//                         comment:
//                             "this padel palce is amazing i will try the experiance again and again the price are good ,the food is good ,i will come again soon",
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//   }
// }

// // Custom widget to represent each rating row with stars and progress
// class RatingRow extends StatelessWidget {
//   final int starCount;
//   final double progress;

//   const RatingRow({
//     Key? key,
//     required this.starCount,
//     required this.progress,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           starCount.toString(),
//           style: const TextStyle(fontSize: 18),
//         ),
//         const SizedBox(
//             width: 10), // Add space between star number and progress bar
//         Expanded(
//           child: LinearProgressIndicator(
//             value: progress,
//             backgroundColor: Colors.grey[300],
//             valueColor: AlwaysStoppedAnimation<Color>(AppConstans.themecolor),
//           ),
//         ),
//       ],
//     );
//   }
// }
