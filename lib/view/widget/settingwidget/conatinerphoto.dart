import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';

class CircleContainerImage extends StatelessWidget {
  const CircleContainerImage({super.key, this.text, required this.image});
  final String? text;

  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConstans.Width / 4,
        width: AppConstans.Width / 4,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(200),
            image: DecorationImage(image: image, fit: BoxFit.cover)));
  }
}
