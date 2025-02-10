import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterialFixedButtom extends StatelessWidget {
  const MaterialFixedButtom(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isEnabled = false,
      this.isrowed = false,
      this.price});

  final String text;
  final void Function()? onPressed;
  final bool isEnabled;
  final bool isrowed;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstans.Hight * .06,
      width: AppConstans.Width,
      decoration: BoxDecoration(
        color: isEnabled
            ? Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme
            : AppConstans.nonenabledbuttomcolor,
        borderRadius: BorderRadius.circular(AppConstans.Radious),
      ),
      child: MaterialButton(
          onPressed: isEnabled ? onPressed : null,
          child: isrowed
              ? Text(
                  text,
                  style: TextStyleClass.getTextStyle(
                    "Bold",
                    AppConstans.Width / 20,
                    color: isEnabled
                        ? AppConstans.Whitecolor
                        : AppConstans.darkgreycolordarktheme,
                  ),
                )
              : Row(
                  children: [
                    Image.asset("images/Wad Of Money.png"),
                    SizedBox(
                      width: AppConstans.Width * .02,
                    ),
                    Text(
                      "$price EGP",
                      style: TextStyleClass.getTextStyle(
                        "weight500",
                        AppConstans.Width / 24,
                        color: AppConstans.Whitecolor,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: AppConstans.Hight * .04,
                      width: AppConstans.Width * .008,
                      decoration: BoxDecoration(color: AppConstans.Whitecolor),
                    ),
                    Spacer(),
                    Text(
                      text,
                      style: TextStyleClass.getTextStyle(
                        "Bold",
                        AppConstans.Width / 24,
                        color: AppConstans.Whitecolor,
                      ),
                    ),
                    // SizedBox(
                    //   width: AppConstans.Width * .05,
                    // ),
                    Spacer()
                  ],
                )),
    );
  }
}
