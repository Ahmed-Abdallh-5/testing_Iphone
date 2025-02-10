import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generalitemclasscontainer.dart';

class ListViewItems extends GetView<Homeimp2> {
  const ListViewItems({super.key, required this.homeimp, this.items});
  final Homeimp2 homeimp;
  final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstans.Hight * .32,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeimp.data.length,
          itemBuilder: (context, index) {
            return ItemsModelClass(
              items: ItemModelJson.fromJson(homeimp.data[index]),
            );
          }),
    );
  }
}
