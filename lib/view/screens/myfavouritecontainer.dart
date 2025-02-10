import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
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
                    "Go forth and search!",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    "once you add to favourite it will show up here!",
                    style: TextStyle(fontSize: 15),
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
