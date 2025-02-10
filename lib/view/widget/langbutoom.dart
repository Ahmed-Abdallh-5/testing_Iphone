import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class langbuttom extends StatelessWidget {
  const langbuttom({super.key, this.langname, this.onpresslnagchangen});
  final String? langname;
  final Function()? onpresslnagchangen;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstans.Hight / 18,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppConstans.Width * .22),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: onpresslnagchangen,
        color: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,
        child: Center(
          child: Text(
            langname!,
            style: TextStyleClass.getTextStyle("Bold", AppConstans.Width / 20,
                color: AppConstans.Whitecolor),
          ),
        ),
      ),
    );
  }
}
