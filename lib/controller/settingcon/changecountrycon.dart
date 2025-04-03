import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/choosecountry/home.dart';
import 'package:get/get.dart';

abstract class ChangeCountry extends GetxController {
  gotohomescreen(categories, selectedCat, {String? countID});
  Getdata();
}

class ChangeCountryimple extends ChangeCountry {
  @override
  HomeDate homeDate = HomeDate(Get.find());
  Settingservices settingservices = Get.find();

  List<String> categoris = [];
  List<String> categorisAR = [];
  List<String> categorisIds = [];
  StatueRequest? statueRequest;

  Getdata() async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await homeDate.getdata();
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);

      var categories = response['data'] as List<dynamic>;
      categoris
          .addAll(categories.map((category) => category['name'].toString()));
      categorisIds
          .addAll(categories.map((category) => category['id'].toString()));
      categorisAR
          .addAll(categories.map((category) => category['nameAr'].toString()));

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
  }

  Refreshindicatorfunc() async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await homeDate.getdata();
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      categoris.clear();
      categorisIds.clear();
      categorisAR.clear();
      var categories = response['data'] as List<dynamic>;

      categoris
          .addAll(categories.map((category) => category['name'].toString()));
      categorisIds
          .addAll(categories.map((category) => category['id'].toString()));
      categorisAR
          .addAll(categories.map((category) => category['nameAr'].toString()));

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
  }

  @override
  void onInit() {
    Getdata();

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  gotohomescreen(categories, selectedCat, {String? countID}) {
    Get.offAllNamed("/homeScreen", arguments: {
      'categories': categories,
      'selectedCat': selectedCat,
      'CountID': countID
    });
  }
}
