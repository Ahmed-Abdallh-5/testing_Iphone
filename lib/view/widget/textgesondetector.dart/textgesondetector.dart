import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';

class TextDectecot extends StatelessWidget {
  const TextDectecot(
      {super.key,
      required this.text,
      required this.ontap,
      this.color,
      this.alignment = Alignment.bottomLeft,
      this.bootomstatus = true,
      this.smallfont = false

      // Default value is assigned here
      });

  final String text;
  final VoidCallback? ontap;
  final Color? color;
  final AlignmentGeometry alignment;
  final bool bootomstatus;
  final bool? smallfont;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyleClass.getTextStyle(
            "Bold",
            smallfont == false
                ? AppConstans.Width / 24
                : AppConstans.Width / 35,
            color: color,
          ),
        ),
      ),
    );
  }
}
