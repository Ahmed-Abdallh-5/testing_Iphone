import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/tournment/tournament.dart';
import 'package:get/get.dart';

abstract class TournmentCon extends GetxController {
  Getdata();
}

class Tournmentconimble extends TournmentCon {
  StatueRequest? statueRequest;
  late List tournament = [];
  GetTournment getTournment = GetTournment(Get.find());
  @override
  Getdata() async {
    statueRequest = StatueRequest.loadinghome;
    update(); // Notify UI of loading state

    var response = await getTournment.Getmymatches();
    statueRequest = handlingdata(response);

    if (statueRequest == StatueRequest.Success) {
      tournament.clear();

      tournament.addAll(response['data']);
      print(tournament.length);
      update();
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "308".tr,
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "307".tr,
      );
    }

    update(); // Ensure UI reflects the final state
  }

  @override
  void onInit() {
    Getdata();
    super.onInit();
  }
}
