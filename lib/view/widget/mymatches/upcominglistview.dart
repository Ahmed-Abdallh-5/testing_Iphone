import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/upcoming.dart';
import 'package:ecommerce/view/widget/mymatches/mymatchescontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpComingListView extends StatelessWidget {
  const UpComingListView({super.key});

  @override
  Widget build(BuildContext context) {
    Mymatchesimble mymatchesimble = Get.put(Mymatchesimble());
    return ListView.builder(
      physics: const BouncingScrollPhysics(), // حركة سلسة
      itemCount: mymatchesimble.upcoming.length,
      itemBuilder: (BuildContext context, index) {
        return MyMatchesContainer(
          hight: AppConstans.Hight / 4, // عرض المحتوى بشكل ديناميكي
          ishistrory: false,
          upcomingModel: UpcomingModel.fromJson(mymatchesimble.upcoming[index]),
        );
      },
    );
  }
}
