import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallofferscon.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListViewallOffersSorting extends GetView<Homeimp2> {
  const ListViewallOffersSorting(
      {super.key, required this.viewallOffersimble, this.items});
  final ViewallOffersimble? viewallOffersimble;
  final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136.h,
      width: double.infinity,
      child: ListView.builder(
          controller: viewallOffersimble!.scrollController,
          scrollDirection: Axis.vertical,
          itemCount: viewallOffersimble!.IsLoadingmore!
              ? viewallOffersimble!.SortedList.length + 1
              : viewallOffersimble!.SortedList.length,
          itemBuilder: (context, index) {
            if (index >= viewallOffersimble!.SortedList.length) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ItemsModelClassViewall(
                hight: 136.h,
                items: ItemModelJson.fromJson(
                    viewallOffersimble!.SortedList[index]),
              );
            }

            // return

            //  ItemsModelClassViewall(
            //   hight: 136.h,
            //   offeredcontainer: true,
            //   items:
            //       ItemModelJson.fromJson(viewallOffersimble!.SortedList[index]),
            // );
          }),
    );
  }
}
