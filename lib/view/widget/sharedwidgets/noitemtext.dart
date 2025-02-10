import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';

class NoItemText extends StatelessWidget {
  const NoItemText({super.key, this.text, this.effectiveWidth});
  final double? effectiveWidth;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstans.PaddingHorizontalAuth),
        child: Text(
          text!,
          style: TextStyleClass.getTextStyle(
            "medium",
            effectiveWidth!,
          ),
        ),
      ),
    );
  }
}
