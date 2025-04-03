import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/widget/containericonbuttom.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/animatedindicator.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/urllancher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CasulaSliderWidget extends StatelessWidget {
  const CasulaSliderWidget(
      {super.key,
      this.items,
      this.onPageChanged,
      this.activeIndex,
      this.onPressedIcon1,
      this.onPressedIcon2,
      this.onPressedIcon3,
      this.iconname1,
      this.iconname2,
      this.iconname3,
      this.name,
      this.urilink});
  final onPageChanged;
  final List<Widget>? items;
  final int? activeIndex;
  final void Function()? onPressedIcon1;
  final void Function()? onPressedIcon2;
  final void Function()? onPressedIcon3;
  final String? iconname1;
  final String? iconname2;
  final String? iconname3;
  final String? urilink;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240.h,
            viewportFraction: 1.5,
            onPageChanged: onPageChanged,
          ),
          items: items,
        ),
        Positioned(
          bottom: 15.h,
          left: 0,
          right: 0,
          child: Center(
            child: AnimtedIndicator(
              activeIndex: activeIndex!,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppConstans.PaddingHorizontalAuth),
          child: Row(
            children: [
              ContainerIconButtom(
                onPressed: onPressedIcon1,
                name: iconname1,
              ),
              const Spacer(),
              URLluncher(
                onPressed: onPressedIcon3,
                name: iconname2,
                urilink: urilink,
              ),

              // const SizedBox(
              //   width: 10,
              // ),
              // ContainerIconButtom(
              //   onPressed: onPressedIcon2,
              //   name: iconname3,
              // ),
              // ContainerIconButtom(
              //   onPressed: onPressedIcon3,
              //   name: iconname3,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
