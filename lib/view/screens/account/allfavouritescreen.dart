import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/screens/myfavouriteslistview.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllFavouriteScreen extends StatelessWidget {
  const AllFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyaccountConimble myaccountConimble = Get.put(MyaccountConimble());
    return GetBuilder<MyaccountConimble>(builder: (settingscreenimble) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Appbartext(appbartext: "85".tr),
          leading: Padding(
            padding: EdgeInsets.only(left: AppConstans.PaddingHorizontal),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
        ),
        body: Column(children: [
          myaccountConimble.MyFavouriteList.length == 0
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppConstans.Hight * .25,
                      ),
                      Icon(
                        Icons.favorite,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        "Go forth and search!",
                        style: TextStyleClass.getTextStyle(
                            "medium", AppConstans.Hight * .035),
                      ),
                      Text(
                        "once you add to favourite it will show up here!",
                        style: TextStyleClass.getTextStyle(
                            "medium", AppConstans.Hight * .02),
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: // MyFavourotelistView(
                      MyFavourotelistView(
                  myaccountCon: MyaccountConimble(),
                ))
        ]),
      );
    });
  }
}
