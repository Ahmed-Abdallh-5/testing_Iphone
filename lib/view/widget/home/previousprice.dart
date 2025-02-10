// import 'package:ecommerce/core/constans/constansappvalues.dart';
// import 'package:ecommerce/core/constans/textstyles/text.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CenteredStrikethroughText extends StatelessWidget {
//   final String text;
//   final double fontSize;
//   final Color lineColor;
//   final double lineThickness;

//   CenteredStrikethroughText({
//     required this.text,
//     required this.fontSize,
//     this.lineColor = Colors.red,
//     this.lineThickness = 1.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Settingservices settingservices = Get.find();
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Text(
//           text,
//           style: TextStyleClass.getTextStyle(
//               "Regular", AppConstans.Width * .035,
//               color: Colors.red),
//         ),
//         // Container for the strikethrough line
//         Container(
//           height: lineThickness,
//           width: (text.length * fontSize * 0.5), // Adjust based on text length
//           color: lineColor,
//         ),
//       ],
//     );
//   }
// }
