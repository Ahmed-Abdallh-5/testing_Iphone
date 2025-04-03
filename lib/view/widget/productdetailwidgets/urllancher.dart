import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

class URLluncher extends StatelessWidget {
  const URLluncher({super.key, this.urilink, this.name, this.onPressed});
  final String? urilink;

  final String? name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Uri uri = Uri.parse(urilink!);

    return Align(
      alignment: Alignment.centerLeft,
      child: Link(
        uri: uri,
        target: LinkTarget.blank,
        builder: (context, openlink) => InkWell(
            onTap: openlink,
            child: Container(
              height: AppConstans.Hight * .048,
              width: AppConstans.Hight * .048,
              decoration: BoxDecoration(
                  color: Get.isDarkMode == false
                      ? AppConstans.Whitecolor
                      : AppConstans.blackcolor,
                  shape: BoxShape.circle),
              child: Center(
                  child: InkWell(
                onTap: onPressed,
                child: Container(
                  child: Image.asset(
                    name!,
                    color: Get.isDarkMode == true
                        ? AppConstans.Whitecolor
                        : AppConstans.blackcolor,
                    height: AppConstans.Hight * .025,
                    width: AppConstans.Hight * .025,
                  ),
                ),
              )),
            )),
      ),
    );
  }
}
