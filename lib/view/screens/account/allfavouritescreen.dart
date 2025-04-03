import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/screens/myfavouriteslistview.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/sharedwidgets/handlingview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllFavouriteScreen extends StatelessWidget {
  const AllFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyaccountConimble myaccountConimble = Get.put(MyaccountConimble());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Appbartext(appbartext: "85".tr),
        leading: Padding(
          padding: EdgeInsets.only(left: AppConstans.PaddingHorizontalAuth),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: GetBuilder<MyaccountConimble>(
        builder: (myaccountConimble) {
          if (myaccountConimble.statueRequest == StatueRequest.loading) {
            return HandlingViewallitems();
          }

          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstans.PaddingHorizontalAuth),
            child: Column(
              children: [
                if (myaccountConimble.MyFavouriteList.isEmpty)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: AppConstans.Hight * .25),
                        Icon(
                          Icons.favorite,
                          size: 100.sp,
                          color: Colors.grey,
                        ),
                        Text(
                          "359".tr,
                          style: TextStyleClass.getTextStyle(
                              "medium", AppConstans.Hight * .035),
                        ),
                        Text(
                          "360".tr,
                          style: TextStyleClass.getTextStyle(
                              "medium", AppConstans.Hight * .02),
                        ),
                      ],
                    ),
                  )
                else
                  Expanded(
                    // ✅ تم تصحيح مكان Expanded داخل Column
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: AppConstans.commonsizeboxhiggt,
                      ),
                      child: MyFavourotelistView(
                        myaccountCon:
                            myaccountConimble, // ✅ استخدام نفس الكونترولر
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
