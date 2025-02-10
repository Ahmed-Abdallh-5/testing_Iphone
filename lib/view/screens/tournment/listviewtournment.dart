import 'package:ecommerce/controller/tornmentcon/tournmentcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/tournmentmodel.dart';
import 'package:ecommerce/view/screens/tournment/sharedchoicebuttom.dart';
import 'package:ecommerce/view/widget/tournment/tournmentcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListviewTournment extends StatelessWidget {
  const ListviewTournment({super.key});

  @override
  Widget build(BuildContext context) {
    Tournmentconimble tournmentconimble = Get.put(Tournmentconimble());
    return SizedBox(
      height: AppConstans.Hight * 0.5,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: tournmentconimble.tournament.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: AppConstans.Hight * .018,
                ),
                TournmentContainer(
                  tournmentModel: TournmentModel.fromJson(
                      tournmentconimble.tournament[index]),
                  date: "Friday 25 Oct. 10:00PM",
                  buttom1: ChoiceButtom(
                    iscolored: true,
                    text1: true,
                    text2: "348".tr,
                    onPressed: () async {},
                  ),
                  buttom2: ChoiceButtom(
                    iscolored: false,
                    text1: false,
                    text3: "349".tr,
                    onPressed: () {
                      Get.toNamed("/tornamentDetailsScreen");
                    },
                  ),
                ),
                // SizedBox(
                //   height: AppConstans.Hight * .015,
                // )
              ],
            );

            // ItemsModelClassViewall(
            //   items:
            //       ItemModelJson.fromJson(viewallitemsimble!.SortedList[index]),
            // );
          }),
    );
  }
}
