import 'package:ecommerce/controller/checkoutcon.dart';
import 'package:ecommerce/controller/checkoutcon/checkoutcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
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
        title: Appbartext(appbartext: "Checkout".tr),
        leading: Padding(
          padding: EdgeInsets.only(left: AppConstans.PaddingHorizontal),
          child: IconButton(
              onPressed: () {
                Get.offAllNamed("/homeScreen");
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppConstans.PaddingHorizontalAuth,
            right: AppConstans.PaddingHorizontalAuth,
            bottom: AppConstans.Hight * .015,
          ),
          child: MaterialFixedButtom(
            isrowed: true,
            isEnabled: true,
            text: "Pay",
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
              CheckOutContainer(
                hight: AppConstans.Hight / 5,
                Radious: 16,
                maintitle: checkoutconimble.item.name,
                secondtitle: "${checkoutconimble.secondtitle![0]}",
                thirdtitle: "${checkoutconimble.formatteddateTime}",
                Sunthirdtitle: " - ${checkoutconimble.fourthtitle![0]}",
                fourthtitle:
                    "${(checkoutconimble.fourthtitle!.length + 1) * 60} min ",
                // price: checkoutconimble.item.price! *
                //     checkoutconimble.fourthtitle!.length,
              ),
              Column(
                children: [
                  //                Text(
                  //   "Powered by" + "Paymob",
                  //   style: TextStyleClass.getTextStyle(
                  //       "weight500", AppConstans.Width * .03),
                  // ),
                ],
              ),
            ],
          )),
    );
  }
}
