import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/data/model/upcoming.dart';
import 'package:ecommerce/view/widget/mymatches/mymatchescontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpComingListView extends StatelessWidget {
  const UpComingListView({super.key});

  @override
  Widget build(BuildContext context) {
    Mymatchesimble mymatchesimble = Get.put(Mymatchesimble());
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), // حركة سلسة
      itemCount: mymatchesimble.upcoming.length,
      itemBuilder: (BuildContext context, index) {
        return MyMatchesContainer(
          ishistrory: false,
          // ishorizonal: true,
          upcomingModel: UpcomingModel.fromJson(mymatchesimble.upcoming[index]),
        );
      },
    );
  }
}
