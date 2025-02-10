import 'package:ecommerce/controller/tornmentcon/tournmentcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/screens/tournment/listviewtournment.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournmentScreen extends StatelessWidget {
  const TournmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Tournmentconimble tournmentconimble = Get.put(Tournmentconimble());
    return GetBuilder<Tournmentconimble>(
        builder: (tournmentconimble) => Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.PaddingHorizontalAuth,
                      ),
                      child: ListviewTournment(),
                    ),
                  ),
                ],
              ),
            ));
  }
}
