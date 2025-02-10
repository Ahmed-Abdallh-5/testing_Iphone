import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/choosecountry/home.dart';

import 'package:get/get.dart';

abstract class ChosseCountry extends GetxController {
  // gotohomescreen(List categories, int selectedCat, {String? countID});
  Getdata();
}

class ChosseCountryimple extends ChosseCountry {
  @override
  HomeDate homeDate = HomeDate(Get.find());
  Settingservices settingservices = Get.find();
  bool iscountrychosed = false;
  bool isenabled = false;
  bool isselected = false;
  List<String> categoris = [];
  List<String> categorisAR = [];
  List<String> categorisIds = [];
  List<String> districts = [];
  List<String> districtsAR = [];
  List<String> districtsIds = [];
  StatueRequest? statueRequest;
  String? selectedCat;
  String? selectedDistrict;
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

  GetSubdata(String id) async {
    statueRequest = StatueRequest.loading;
    update();

    var response = await homeDate.getsubdata(id);
    statueRequest = handlingdata(response);

    if (StatueRequest.Success == statueRequest) {
      print(
          "===================================================================");
      print(response);
      districts.clear();
      districtsAR.clear();
      districtsIds.clear();
      var districtsList = response['data']['districts'] as List<dynamic>;

      districts
          .addAll(districtsList.map((district) => district['name'].toString()));
      districtsAR.addAll(
          districtsList.map((district) => district['nameAr'].toString()));
      districtsIds
          .addAll(districtsList.map((district) => district['id'].toString()));

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
    // GetSubdata("1");
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  gotohomescreen(String governmate, {String? district}) {
    Get.toNamed(
      "/homeScreen",
    );
    settingservices.sharedPref.setString("Step", "2");
  }
}
