// import 'package:ecommerce/core/constans/constansappvalues.dart';
// import 'package:ecommerce/view/widget/productdetailwidgets/rating.dart';
// import 'package:flutter/material.dart';

// class ReviewCommentsPage extends StatelessWidget {
//   const ReviewCommentsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
//     double screenhight = MediaQuery.of(context).size.height;
//     return Container(
//       height: screenhight * 3 / 2,
//       width: double.infinity,
//       child: Material(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenwidth * .03),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Cancel",
//                     style: TextStyle(
//                         color: AppConstans.themecolor,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16),
//                   ),
//                   Spacer(),
//                   Text(
//                     "Write a Review",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   Spacer(),
//                   Text("Send",
//                       style: TextStyle(
//                           color: AppConstans.themecolor,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16)),
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               RatingBarWidget(
//                 readOnly: false,
//                 starSize: 25,
//                 Rating: 4.5,
//                 onChanged: (double rating) {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
