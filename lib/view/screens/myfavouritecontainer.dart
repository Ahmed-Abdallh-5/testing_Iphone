import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        builder: (myAccountCon) {
          if (myAccountCon.MyFavouriteList.isEmpty) {
            // Show a message when the list is empty

            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 80.sp,
                    color: Colors.grey,
                  ),
                  Text(
                    "359".tr,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
                  ),
                  Text(
                    "360".tr,
                    style: TextStyle(fontSize: 15.sp),
                  )
                ],
              ),
            );
          }

          // Safely access the first item
          return Padding(
            padding: EdgeInsets.only(top: 16.r),
            child: ItemsModelClassViewall(
              hight: 136.h,
              items: ItemModelJson.fromJson(myAccountCon.MyFavouriteList[0]),
            ),
          );
        },
      ),
    );
  }
}
