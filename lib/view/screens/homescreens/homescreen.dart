import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/controller/navbar/navigationbuttombarcon.dart';
import 'package:ecommerce/view/screens/account/accountscreennew.dart';

import 'package:ecommerce/view/widget/home/navigarorbuttombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyaccountConimble myaccountCon = Get.put(MyaccountConimble());
    ButtomNavBarControllerime buttomNavBarControllerime =
        Get.put(ButtomNavBarControllerime());
    return GetBuilder<ButtomNavBarControllerime>(
      builder: (buttomNavBarControllerime) => Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: .1,
          child: Row(
            children: [
              IconButtomNav(
                onPressed: () {
                  buttomNavBarControllerime.changepage(0);
                },
                image: "images/homeicon.png",
                navlabel: "Home",
                isactivated:
                    buttomNavBarControllerime.pagenumber == 0 ? true : false,
              ),
              Spacer(),
              IconButtomNav(
                onPressed: () {
                  buttomNavBarControllerime.changepage(1);
                },
                image: "images/trophy.png",
                navlabel: "Tournaments",
                isactivated:
                    buttomNavBarControllerime.pagenumber == 1 ? true : false,
              ),
              Spacer(),
              IconButtomNav(
                onPressed: () {
                  buttomNavBarControllerime.changepage(2);
                },
                image: "images/calender.png",
                navlabel: "My matches",
                isactivated:
                    buttomNavBarControllerime.pagenumber == 2 ? true : false,
              ),
              Spacer(),
              IconButtomNav(
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
