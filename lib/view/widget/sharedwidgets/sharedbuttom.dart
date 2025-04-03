import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sharedbuttom extends StatelessWidget {
  const Sharedbuttom(
      {super.key,
      this.onpreesed,
      required this.text,
      required this.hight,
      this.isEnabled = true,
      this.color,
      this.boredercolor,
      this.textrcolor = AppConstans.Whitecolor

      // Default value is true
      });

  final VoidCallback? onpreesed;
  final String text;
  final double? hight;
  final bool isEnabled;
  final Color? color;
  final Color? boredercolor;
  final Color? textrcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: hight,
      child: MaterialButton(
        onPressed: isEnabled ? onpreesed : null, // Disable functionality
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstans.Radious)),
        color: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,

        // Use same color
        disabledColor: AppConstans.nonenabledbuttomcolor,
        child: Center(
          child: Text(
            text,
            style: TextStyleClass.getTextStyle(
              "weight400",
              AppConstans.Width / 24,
              color: textrcolor,
            ),
          ),
        ),
      ),
    );
  }
}
