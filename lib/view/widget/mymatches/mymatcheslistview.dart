import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/history.dart';

import 'package:ecommerce/view/widget/mymatches/mymatchescontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMatchesListView extends StatelessWidget {
  const MyMatchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    Mymatchesimble mymatchesimble = Get.put(Mymatchesimble());
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), // نفس المبدأ هنا
      itemCount: mymatchesimble.history.length,
      itemBuilder: (BuildContext context, index) {
        return MyMatchesContainer(
          hight: AppConstans.Hight / 4, // عرض المحتوى بشكل ديناميكي
          ishistrory: true,
          history: HistoryModel.fromJson(mymatchesimble.history[index]),
        );
      },
    );
  }
}
