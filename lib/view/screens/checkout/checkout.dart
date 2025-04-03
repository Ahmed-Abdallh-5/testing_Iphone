import 'package:ecommerce/controller/checkoutcon/checkoutcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/view/screens/checkout/containerwidget.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, this.hight, this.Radious});
  final double? hight;
  final double? Radious;

  @override
  Widget build(BuildContext context) {
    Checkoutconimble checkoutconimble = Get.put(Checkoutconimble());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Appbartext(appbartext: "366".tr),
        leading: Padding(
          padding: EdgeInsets.only(left: AppConstans.PaddingHorizontalAuth),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppConstans.PaddingHorizontalAuth,
            right: AppConstans.PaddingHorizontalAuth,
            bottom: AppConstans.commonsizeboxhiggt,
          ),
          child: MaterialFixedButtom(
            isrowed: true,
            isEnabled: true,
            text: "365".tr,
            onPressed: () async {
              checkoutconimble.Bookitem(checkoutconimble.subid,
                  checkoutconimble.dateTime, checkoutconimble.fourthtitle!);
            },
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstans.PaddingHorizontalAuth),
          child: Column(
            children: [
              SizedBox(
                height: AppConstans.commonsizeboxhiggt,
              ),
              CheckOutContainer(
                Radious: AppConstans.Radious,
                maintitle: translationDataBase(
                  checkoutconimble.item.nameAr,
                  checkoutconimble.item.name,
                ),

                secondtitle: "${checkoutconimble.secondtitle![0]}",
                thirdtitle: "${checkoutconimble.formatteddateTime}",
                Sunthirdtitle: " - ${checkoutconimble.fourthtitle![0]}",
                fourthtitle: "${(checkoutconimble.fourthtitle!.length) * 60} " +
                    "367".tr,
                // price: checkoutconimble.item.price! *
                //     checkoutconimble.fourthtitle!.length,
              ),
            ],
          )),
    );
  }
}
