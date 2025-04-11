import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/controller/navbar/navigationbuttombarcon.dart';

import 'package:ecommerce/view/widget/home/navigarorbuttombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyaccountConimble myaccountCon = Get.put(MyaccountConimble());
    ButtomNavBarControllerime buttomNavBarControllerime =
        Get.put(ButtomNavBarControllerime());
    return GetBuilder<ButtomNavBarControllerime>(
      builder: (buttomNavBarControllerime) =>  Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 100.h,
            elevation: .1,
            child: Row(
              children: [
                IconButtomNav(
                  onPressed: () {
                    buttomNavBarControllerime.changepage(0);
                  },
                  image: "images/homeicon.png",
                  navlabel: "368".tr,
                  isactivated:
                      buttomNavBarControllerime.pagenumber == 0 ? true : false,
                ),
                Spacer(),
                IconButtomNav(
                  onPressed: () {
                    buttomNavBarControllerime.changepage(1);
                  },
                  image: "images/trophy.png",
                  navlabel: "369".tr,
                  isactivated:
                      buttomNavBarControllerime.pagenumber == 1 ? true : false,
                ),
                Spacer(),
                IconButtomNav(
                  onPressed: () {
                    buttomNavBarControllerime.changepage(2);
                  },
                  image: "images/calender.png",
                  navlabel: "370".tr,
                  isactivated:
                      buttomNavBarControllerime.pagenumber == 2 ? true : false,
                ),
                Spacer(),
                IconButtomNav(
                  navlabel: "371".tr,
                  circleavater: true,
                  onPressed: () async {
                    myaccountCon.Getdata();
                    buttomNavBarControllerime.changepage(3);
                  },
                  isactivated:
                      buttomNavBarControllerime.pagenumber == 3 ? true : false,
                )
              ],
            ),
          ),
          body: buttomNavBarControllerime.pages
              .elementAt(buttomNavBarControllerime.pagenumber),
        ),
     
    );
  }
}
