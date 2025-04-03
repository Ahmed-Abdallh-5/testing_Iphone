import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/data/model/upcoming.dart';
import 'package:ecommerce/view/widget/mymatches/mymatchescontainer.dart';
import 'package:ecommerce/view/widget/sharedwidgets/noitemtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpComingListViewHorizontal extends StatelessWidget {
  const UpComingListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    Mymatchesimble mymatchesimble = Get.put(Mymatchesimble());
    return GetBuilder<Mymatchesimble>(
        builder: (mymatchesimble) => mymatchesimble.upcoming.isEmpty
            ? Container(
                height: 144.h,
                child: NoItemText(
                  effectiveWidth: 24.sp,
                  text: '342'.tr,
                ),
              )
            : SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // physics: const BouncingScrollPhysics(),
                  itemCount: mymatchesimble.upcoming.length,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: MyMatchesContainer(
                            width: 280.w,
                            isprice: false,
                            ishorizonal: true,
                            ishistrory: false,
                            upcomingModel: UpcomingModel.fromJson(
                                mymatchesimble.upcoming[index]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ));
  }
}
