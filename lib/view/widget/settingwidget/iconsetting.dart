import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class IconSetting extends StatelessWidget {
  const IconSetting(
      {super.key,
      this.switcher,
      this.color,
      this.value,
      this.activeColor,
      this.onChanged,
      this.onTap,
      this.image,
      this.text,
      this.istrashed,
      this.icon,
      this.isred = false,
      this.isrowed = false,
      this.rowtext});

  final IconData? icon;
  final bool? switcher;
  final Color? color;
  final bool? istrashed;
  final void Function()? onTap;
  final bool? value;
  final String? image;
  final String? text;
  final void Function(bool)? onChanged;
  final Color? activeColor;
  final bool? isred;
  final bool? isrowed;
  final String? rowtext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          // Icon/Image Container
          Container(
            height: AppConstans.Hight * 0.035, // Responsive height
            width: AppConstans.Hight * 0.035, // Responsive width
            child: Image.asset(
              image!,
              color: isred!
                  ? Colors.red
                  : (Get.isDarkMode
                      ? AppConstans.Whitecolor
                      : AppConstans.blackcolor),
            ),
          ),
          SizedBox(
            width: AppConstans.Width * 0.02, // Responsive spacing
          ),

          // Text
          Expanded(
            child: Row(
              children: [
                Text(
                  text!,
                  style: TextStyleClass.getTextStyle(
                    "Regular",
                    AppConstans.Hight * 0.022, // Responsive font size
                    color: istrashed == true ? Colors.red : null,
                  ),
                ),
                Spacer(),
                isrowed == true
                    ? Text(
                        rowtext!,
                        style: TextStyleClass.getTextStyle(
                          "Regular",
                          AppConstans.Hight * 0.02, // Responsive font size
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          // Spacer or Switch
          switcher == true
              ? FlutterSwitch(
                  activeColor: activeColor ?? Colors.green,
                  value: value!,
                  onToggle: onChanged!,
                  width: AppConstans.Width * 0.12, // Responsive width
                  height: AppConstans.Hight * 0.035, // Responsive height
                  toggleSize:
                      AppConstans.Hight * 0.02, // Responsive toggle size
                  activeToggleColor: Colors.white,
                  inactiveToggleColor: Colors.grey,
                  inactiveColor: const Color.fromARGB(255, 121, 116, 126),
                  inactiveIcon: Icon(
                    icon,
                    color: Colors.white,
                    size: AppConstans.Hight * 0.015, // Responsive icon size
                  ),
                  borderRadius: AppConstans.Hight * 0.02, // Responsive radius
                  padding: AppConstans.Hight * 0.005, // Responsive padding
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  size: AppConstans.Hight * 0.02, // Responsive icon size
                ),
        ],
      ),
    );
  }
}
