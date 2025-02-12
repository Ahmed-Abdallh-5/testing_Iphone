import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MyFavouriteOneContainer extends StatelessWidget {
  const MyFavouriteOneContainer({
    super.key,
    required this.myAccountCon,
  });

  final MyaccountConimble myAccountCon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder<MyaccountConimble>(
        builder: (controller) {
          if (controller.MyFavouriteList.isEmpty) {
            // Show a message when the list is empty

            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: AppConstans.Hight * .05,
                  ),
                  Icon(
                    Icons.favorite,
                    size: AppConstans.Hight * .1,
                    color: Colors.grey,
                  ),
                  Text(
                    "359".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppConstans.Hight * .035),
                  ),
                  Text(
                    "360".tr,
                    style: TextStyle(fontSize: AppConstans.Hight * .02),
                  )
                ],
              ),
            );
          }

          // Safely access the first item
          return ItemsModelClassViewall(
            items: ItemModelJson.fromJson(controller.MyFavouriteList[0]),
          );
        },
      ),
    );
  }
}
