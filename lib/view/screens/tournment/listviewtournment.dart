import 'package:ecommerce/controller/tornmentcon/tournmentcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/tournmentmodel.dart';
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
                TournmentContainer(
                  tournmentModel: TournmentModel.fromJson(
                      tournmentconimble.tournament[index]),
                ),
              ],
            );
          }),
    );
  }
}
