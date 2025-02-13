import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/maincontainer.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/sliderwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/carousewidget.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/buttom.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Settingservices settingServices = Get.find();
    final Homeimp2 homeimp2 = Get.put(Homeimp2());
    final ProductDetailsConimble productDetailsConimble =
        Get.put(ProductDetailsConimble());

    return GetBuilder<ProductDetailsConimble>(
      builder: (productDetailsConimble) => Form(
        key: productDetailsConimble.formkey,
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: AppConstans.PaddingHorizontalAuth,
              right: AppConstans.PaddingHorizontalAuth,
              bottom: AppConstans.Hight * .015,
            ),
            child: MaterialFixedButtom(
              price: (productDetailsConimble.items.price! *
                      (productDetailsConimble.ChosenHoursList.length) *
                      .25)
                  .toInt(),
              isrowed: productDetailsConimble.ChosenHoursList.length == 0 ||
                      productDetailsConimble.chosenCourts.length == 0
                  ? true
                  : false,
              isEnabled: productDetailsConimble.ChosenHoursList.length == 0 ||
                      productDetailsConimble.chosenCourts.length == 0
                  ? false
                  : true,
              text: "358".tr,
              onPressed: () async {
                // print(productDetailsConimble.ChosenHoursList);
                // print(productDetailsConimble.chosenCourts);

                productDetailsConimble.GotoCheckoutscreen();
              },
            ),
          ),
          body: ListView(
            children: [
              // CasulaSliderWidget(
              //   items: [
              //     Carousewidget(
              //         imageUrl: productDetailsConimble.items.gallery?[0].image),
              //     Carousewidget(
              //         imageUrl: productDetailsConimble.items.gallery?[1].image),
              //     Carousewidget(
              //         imageUrl: productDetailsConimble.items.gallery?[2].image),
              //   ],
              //   activeIndex: productDetailsConimble.activeindex,
              //   iconname1: "images/Alt Arrow Left.png",
              //   iconname2: "images/Routing 2.png",
              //   onPageChanged: (index, reason) {
              //     productDetailsConimble.onPageChanged(index, reason);
              //   },
              //   onPressedIcon1: () {
              //     Get.back();
              //   },
              //   urilink: productDetailsConimble.items.locationLink,
              // ),
              MainContainerWidget(
                mainhighet: AppConstans.Hight / 1.3,
                dy: -AppConstans.Hight * .01,
                color: Get.isDarkMode == true
                    ? const Color.fromARGB(255, 21, 21, 21)
                    : const Color.fromARGB(255, 255, 255, 255),
                maintext: translationDataBase(
                    productDetailsConimble.items.nameAr,
                    productDetailsConimble.items.name),
                Submaintext: translationDataBase(
                    productDetailsConimble.items.location,
                    productDetailsConimble.items.location),
                MainRadious: AppConstans.Radious,
                Title2: "332".tr,
                SubmTitle2: productDetailsConimble.items.phone,
                // SubmTitle3: "01:00 PM - 09:00 PM",
                Title4: "333".tr,
                Title5: "334".tr,
                // isclicked: productDetailsConimble.isClickedList[0],
                sizedhight: AppConstans.Hight * .04,

                sizedhight2: AppConstans.Hight * .05,

                minWidth: AppConstans.Width / 4,

                Radious: AppConstans.Radious / 2,
                Radious2: AppConstans.Radious,
                finaltitle: "343".tr,
                finaltext: "344".tr,
                // onTaplistview: () {
                //   // productDetailsConimble.ischosen();
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
