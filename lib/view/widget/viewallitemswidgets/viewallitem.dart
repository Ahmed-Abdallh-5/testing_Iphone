import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallitemcontroller.dart';
import 'package:ecommerce/core/funtions/responivefunc.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListViewallItems extends GetView<Homeimp2> {
  const ListViewallItems(
      {super.key, required this.viewallItemsimble, this.items});
  final ViewallItemsimble? viewallItemsimble;
  final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136.h,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: viewallItemsimble!.data.length,
          itemBuilder: (context, index) {
            return ItemsModelClassViewall(
              hight: 136.h,
              items: ItemModelJson.fromJson(viewallItemsimble!.data[index]),
            );
          }),
    );
  }
}
