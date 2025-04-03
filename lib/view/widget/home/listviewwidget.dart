import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'generalitemclasscontainer.dart';

class ListViewItems extends GetView<Homeimp2> {
  const ListViewItems({super.key, required this.homeimp, this.items});
  final Homeimp2 homeimp;
  final ItemModelJson? items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        cacheExtent: 1000,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ItemsModelClass(
            items: ItemModelJson.fromJson(homeimp.data[index]),
          );
        },
      ),
    );
  }
}
