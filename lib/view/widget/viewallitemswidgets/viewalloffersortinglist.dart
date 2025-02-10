import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallofferscon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/previousprice.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewallOffersSorting extends GetView<Homeimp2> {
  const ListViewallOffersSorting(
      {super.key, required this.viewallOffersimble, this.items});
  final ViewallOffersimble? viewallOffersimble;
  final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.49,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: viewallOffersimble!.SortedList.length,
          itemBuilder: (context, index) {
            return ItemsModelClassViewall(
              offeredcontainer: true,
              items:
                  ItemModelJson.fromJson(viewallOffersimble!.SortedList[index]),
            );
          }),
    );
  }
}
