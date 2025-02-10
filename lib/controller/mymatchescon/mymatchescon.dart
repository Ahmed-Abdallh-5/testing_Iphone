import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/mymathes/mymtaches.dart';
import 'package:get/get.dart';

abstract class Mymatches extends GetxController {
  Getdata();
  refreshdata();
}

class Mymatchesimble extends Mymatches {
  @override
  List upcoming = [];
  List history = [];
  StatueRequest? statueRequest;
  GetMyMatches getMyMatches = GetMyMatches(Get.find());

  Getdata() async {
    statueRequest = StatueRequest.loadinghome;
    update(); // Notify UI of loading state

    var response = await getMyMatches.Getmymatches();
    statueRequest = handlingdata(response);

    if (statueRequest == StatueRequest.Success) {
      upcoming.clear();
      history.clear();
      upcoming.addAll(response['upcoming']);
      history.addAll(response["history"]);
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
  refreshdata() async {
    statueRequest = StatueRequest.loadinghome;
    update(); // Notify UI of loading state

    var response = await getMyMatches.Getmymatches();
    statueRequest = handlingdata(response);

    if (statueRequest == StatueRequest.Success) {
      upcoming.clear();
      history.clear();
      upcoming.addAll(response['upcoming']);
      history.addAll(response["history"]);
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

    update();
  }

  @override
  void onInit() {
    Getdata();

    super.onInit();
  }
}
