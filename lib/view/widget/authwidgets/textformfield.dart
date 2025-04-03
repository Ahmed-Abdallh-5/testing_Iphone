import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Textformfield extends StatelessWidget {
  const Textformfield(
      {super.key,
      required this.hinttextstring,
      this.icon,
      this.textInputType,
      required this.textEditingController,
      required this.validatorfunc,
      this.obscureText,
      this.showpassword,
      this.iconsuffix,
      this.onFieldSubmitted,
      this.onChanged,
      this.lapeltext,
      this.errortext,
      this.iserroredtext = false,
      this.isphonetext = false,
      this.preixtext});

  final String hinttextstring;
  final Icon? icon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validatorfunc;
  final bool? obscureText;
  final void Function()? showpassword;
  final Icon? iconsuffix;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? lapeltext;
  final String? errortext;
  final bool? iserroredtext;
  final bool? isphonetext;
  final String? preixtext;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppConstans.Radious);

    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
        color: Get.isDarkMode ? AppConstans.Whitecolor : AppConstans.blackcolor,
      ),
      obscureText: obscureText ?? false,
      validator: validatorfunc,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        // prefixText: isphonetext == true ? preixtext ?? "+20" : null,
        // prefixStyle: TextStyle(
        //   color:
        //       Get.isDarkMode ? AppConstans.Whitecolor : AppConstans.blackcolor,
        //   fontSize: 16.sp,
        // ),
        errorText: iserroredtext == true ? errortext : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          lapeltext ?? "",
          style: TextStyleClass.getTextStyle(
            "weight400",
            12.sp,
            color: Get.isDarkMode
                ? AppConstans.darkgreycolordarktheme
                : AppConstans.darkgreycolor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.isDarkMode
                ? AppConstans.darkgreycolordarktheme
                : AppConstans.Bordercolor,
          ),
          borderRadius: borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.isDarkMode
                ? AppConstans.darkgreycolordarktheme
                : AppConstans.Bordercolor,
          ),
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.isDarkMode
                ? AppConstans.darkgreycolordarktheme
                : AppConstans.Bordercolor,
          ),
          borderRadius: borderRadius,
        ),
        hintText: hinttextstring,
        hintStyle: TextStyleClass.getTextStyle(
          "weight400",
          16.sp,
          color: Get.isDarkMode
              ? AppConstans.darkgreycolordarktheme
              : AppConstans.darkgreycolor,
        ),
        suffixIcon: iconsuffix != null
            ? InkWell(
                child: iconsuffix,
                onTap: showpassword,
              )
            : null,
        contentPadding:
            EdgeInsets.symmetric(vertical: 11.0.h, horizontal: 16.0.w),
      ),
    );
  }
}
