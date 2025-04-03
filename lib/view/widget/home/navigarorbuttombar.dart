import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IconButtomNav extends StatelessWidget {
  IconButtomNav({
    super.key,
    this.onPressed,
    this.isactivated = false,
    this.image,
    this.navlabel,
    this.circleavater = false,
  });

  final String? image;
  final bool? isactivated;
  final String? navlabel;
  final void Function()? onPressed;
  final bool? circleavater;

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();

    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 32.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape:
                  circleavater == true ? BoxShape.circle : BoxShape.rectangle,
              color: isactivated == true
                  ? Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme
                  : Colors.transparent,
              borderRadius: circleavater == true
                  ? null
                  : BorderRadius.circular(AppConstans.Radious),
            ),
            alignment: Alignment.center,
            child: circleavater == true
                ? CircleAvatar(
                    radius: AppConstans.Radious,
                    backgroundImage: CachedNetworkImageProvider(
                        settingservices.sharedPref.getString("photo")!),
                  )
                : Image.asset(
                    image!,
                    color: isactivated == true
                        ? AppConstans.Whitecolor
                        : AppConstans.grey,
                    height: 25.h, // Adjust image size
                    width: 25.w,
                  ),
          ),
          Text(
            navlabel!,
            textAlign: TextAlign.center,
            style: TextStyleClass.getTextStyle(
              'Medium',
              12.sp, // Responsive font size
              color: isactivated == true
                  ? Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme
                  : AppConstans.grey,
            ),
          ),
        ],
      ),
    );
  }
}
