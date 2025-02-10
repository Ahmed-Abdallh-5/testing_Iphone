import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generalitemclasscontainer.dart';

class ListViewOffers extends GetView<Homeimp2> {
  const ListViewOffers({super.key, required this.homeimp});
  final Homeimp2 homeimp;
  // final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstans.Hight * .35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeimp.offers.length,
          itemBuilder: (context, index) {
            return ItemsModelClass(
              offercontainer: true,
              items: ItemModelJson.fromJson(homeimp.offers[index]),
            );
          }),
    );
  }
}
