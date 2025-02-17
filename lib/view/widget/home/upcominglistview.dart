import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/upcoming.dart';
import 'package:ecommerce/view/screens/checkout/containerwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingListViewItems extends GetView<Homeimp2> {
  const UpcomingListViewItems(
      {super.key, required this.mymatchesimble, this.upcomingModel});
  final Mymatchesimble mymatchesimble;
  // final ItemModelJson? items;
  final UpcomingModel? upcomingModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstans.Hight / 4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mymatchesimble.upcoming.length,
          itemBuilder: (context, index) {
            return ItemsModelClass(
                // items: ItemModelJson.fromJson(homeimp.data[index]),
                );
          }),
    );
  }
}

class ItemsModelClass extends GetView<Homeimp2> {
  const ItemsModelClass({
    super.key,
  });
  // final ItemModelJson? items;
  // final Homeimp2? homeimp2;

  @override
  Widget build(BuildContext context) {
    Homeimp2 homeimp2 = Get.put(Homeimp2());
    return SizedBox(
      width: AppConstans.Width * .70,
      child: CheckOutContainer(
        isbool: false,
        hight: AppConstans.Hight / 5,
        Radious: 16,
        price: 200,
        maintitle: "Padel Station",
        secondtitle: "Court A",
        thirdtitle: "Monday 3 Oct ,07:00 PM - 9:00 PM",
        fourthtitle: "120 min ",
        Sunthirdtitle: "",
      ),
    );
  }
}
