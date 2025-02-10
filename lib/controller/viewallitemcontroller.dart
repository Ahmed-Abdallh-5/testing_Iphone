import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/viewall/viewallitem.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ViewallItems extends GetxController {
  Getdata(id);
  gotoproductdetails(items);
}

class ViewallItemsimble extends ViewallItems {
  List SortedList = [];
  bool isCheckBoxActiveOffers = true;
  bool isCheckBoxActivePrices = true;
  List Searchlistmodel = [];
  bool? isshaerching = false;
  List<ItemModelJson> Searchlist = [];
  ItemModelJson? item;
  String? Catid;
  bool? IsSortByPrice = false;
  bool? IsSortByRating = false;
  bool? IsSortDiscount = false;
  String? Districtid;
  StatueRequest? statueRequest;
  HomeDate2Viewallitems homeDate2Viewallitems =
      HomeDate2Viewallitems(Get.find());
  List data = [];
  Map favoriteMap = {};
  Settingservices settingservices = Get.find();
  Getdata(id) async {
    statueRequest = StatueRequest.loadinghome;
    update();
    var response = await homeDate2Viewallitems.getdata(id);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      data.addAll(response['data'].where(
          (element) => element['active'] == true && element['discount'] != 0));
      // offers.addAll(response['offers']);
      for (var item in data) {
        favoriteMap[item['id']] = item['favorite'];
      }
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
    update();
  }

  Refreshdata(id) async {
    statueRequest = StatueRequest.loadinghome;
    update();
    var response = await homeDate2Viewallitems.getdata(id);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      data.clear();
      data.addAll(response['data'].where(
          (element) => element['active'] == true && element['discount'] != 0));
      // offers.addAll(response['offers']);
      for (var item in data) {
        favoriteMap[item['id']] = item['favorite'];
      }
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
    update();
  }

  onChanging(Value) {
    if (Value == "") {
      isshaerching = false;
    } else {
      isshaerching = true;
      seacrch(Value);
    }

    update();
  }

  seacrch(name) async {
    statueRequest = StatueRequest.loadingSearch;
    update();
    var response = await homeDate2Viewallitems.Searchdata(Catid!, name);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      Searchlistmodel.clear();
      Searchlistmodel.addAll(response['data']);

      Searchlist.clear();
      Searchlist.addAll(Searchlistmodel.map((e) => ItemModelJson.fromJson(e)));

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
    update();
  }

  Clearsorting() {
    SortedList.clear();
  }

  Sort(sortedby) async {
    statueRequest = StatueRequest.loadingSearch;
    update();
    var response = await homeDate2Viewallitems.sortdata(Catid!, sortedby);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print("object");
      // print(response);
      SortedList.clear();

      //////////////must be offers //////////////////
      SortedList.addAll(
          response['data'].where((element) => element['active'] == true));
      print(SortedList[0]['gallery']);
      // Searchlist.addAll(Searchlistmodel.map((e) => ItemModelJson.fromJson(e)));

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
    update();
  }

  CheckboxStatuesOffers(bool val) {
    if (val == true) {
      isCheckBoxActiveOffers = true;
      isCheckBoxActivePrices = false;
      update();
    } else {
      isCheckBoxActiveOffers = true;
      isCheckBoxActivePrices = true;
    }
    update();
  }

  CheckboxStatuesPrices(bool val) {
    if (val == true) {
      isCheckBoxActiveOffers = false;
      isCheckBoxActivePrices = true;
      update();
    } else {
      isCheckBoxActiveOffers = true;
      isCheckBoxActivePrices = true;
    }
    update();
  }

  gotoproductdetails(items) {
    Get.toNamed("/productsdetails",
        arguments: {"itemmodel": items, 'map': favoriteMap});
  }

  onChangedIsSortByPrice(value) {
    IsSortByPrice = value;
    update();
  }

  // onChangedIsSortByRating(value) {
  //   IsSortByRating = value;
  //   update();
  // }

  onChangedIsSortOffers(value) {
    isCheckBoxActiveOffers = false;
    isCheckBoxActivePrices = true;
    update();
  }

  @override
  void onInit() {
    Catid = settingservices.sharedPref.getString("selectedCat")!;
    Districtid = settingservices.sharedPref.getString("selecteddisc");
    // item = Get.arguments['itemmodel'];
    // data = Get.arguments['data'];

    Getdata(Catid);

    super.onInit();
  }
}
