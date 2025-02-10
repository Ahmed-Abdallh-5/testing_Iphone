import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.hinttext,
    this.onChanged,
    required this.issortedicon,
    this.onPressed,
  });

  final String? hinttext;
  final void Function(String)? onChanged;
  final bool issortedicon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            // elevation: 0.5,
            borderRadius: BorderRadius.circular(AppConstans.Radious / 2),
            child: Container(
              decoration: BoxDecoration(
                  color: Get.isDarkMode == true
                      ? AppConstans.secondblackcolor
                      : AppConstans.Whitecolor,
                  borderRadius: BorderRadius.circular(AppConstans.Radious),
                  border: Border.all(
                    color: Get.isDarkMode == true
                        ? AppConstans.darkgreycolor
                        : AppConstans.Bordercolor,
                  )),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.PaddingHorizontalAuth),
                    child: Image.asset(
                      "images/Magnifer.png",
                      color: Get.isDarkMode == true
                          ? AppConstans.darkgreycolor
                          : AppConstans.grey,
                      height: AppConstans.Hight * .03,
                      width: AppConstans.Hight * .03,
                    ),
                  ),
                  SizedBox(),
                  Expanded(
                    child: TextField(
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: hinttext,
                        hintStyle: TextStyleClass.getTextStyle(
                            "weight300", AppConstans.Width * .04,
                            color: Get.isDarkMode == true
                                ? AppConstans.Whitecolor
                                : Color.fromARGB(160, 2, 7, 1)),
                        border: InputBorder.none, // Removes the underline
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (issortedicon)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? AppConstans.maincolordarktheme
                    : AppConstans.maincolorlighttheme,
                borderRadius: BorderRadius.circular(AppConstans.Radious),
              ),
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.sort,
                  color: AppConstans.Whitecolor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
