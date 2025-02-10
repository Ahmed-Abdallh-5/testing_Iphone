import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:flutter/material.dart';
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
    final double itemSize =
        AppConstans.Hight * 0.04; // Common size for all items

    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
        children: [
          Container(
            height: itemSize,
            width: itemSize * 2,
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
                  : BorderRadius.circular(AppConstans.Hight * 0.04),
            ),
            alignment: Alignment.center,
            child: circleavater == true
                ? CircleAvatar(
                    radius: itemSize / 2,
                    backgroundImage: CachedNetworkImageProvider(
                        settingservices.sharedPref.getString("photo")!),
                  )
                : Image.asset(
                    image!,
                    color: isactivated == true
                        ? AppConstans.Whitecolor
                        : AppConstans.grey,
                    height: itemSize * 0.8, // Adjust image size
                    width: itemSize * 0.8,
                  ),
          ),
          Text(
            circleavater == true ? "Account" : navlabel!,
            textAlign: TextAlign.center,
            style: TextStyleClass.getTextStyle(
              'Medium',
              AppConstans.Hight * 0.015, // Responsive font size
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
