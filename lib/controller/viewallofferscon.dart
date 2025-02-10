import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/viewall/viewallitem.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ViewallOffers extends GetxController {
  onChangedIsSortByPrice(value);
  // onChangedIsSortByRating(value);
  onChangedIsSortOffers(value);
  Getdata(id);
  Refreshfunc(id);
  gotoproductdetails(items);
}

class ViewallOffersimble extends ViewallOffers {
  List SortedList = [];
  bool isCheckBoxActiveOffers = true;
  bool isCheckBoxActivePrices = true;
  // List SortedByRating = [];
  // List SortedByPrice = [];
  List Searchlistmodel = [];
  List<ItemModelJson> Searchlist = [];
  bool? isshaerching = false;
  ItemModelJson? item;
  String? Catid;
  String? Districtid;
  bool? IsSortByPrice = false;
  bool? IsSortByRating = false;
  bool? IsSortHightsDiscount = false;
  StatueRequest? statueRequest;
  HomeDate2Viewallitems homeDate2Viewallitems =
      HomeDate2Viewallitems(Get.find());
  List data = [];
  List offers = [];
  Map favoriteMap = {};
  Settingservices settingservices = Get.find();
  Getdata(id) async {
    statueRequest = StatueRequest.loadinghome;
    update();
    var response = await homeDate2Viewallitems.getdata(id);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      // data.addAll(response['items']);
      offers.addAll(
          response['data'].where((element) => element['discount'] != 0));
      for (var item in offers) {
        favoriteMap[item['id']] = item['favorite'];
        print(favoriteMap);
      }
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

  Refreshfunc(id) async {
    statueRequest = StatueRequest.loadinghome;
    update();
    var response = await homeDate2Viewallitems.getdata(id);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      offers.clear();
      offers.addAll(response['data']);
      for (var item in offers) {
        favoriteMap[item['id']] = item['favorite'];
        print(favoriteMap);
      }
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
      print(response);
      SortedList.clear();
      //////////////must be offers //////////////////
      SortedList.addAll(response['data']);

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

  onChanging(Value) {
    if (Value == "") {
      isshaerching = false;
    } else {
      isshaerching = true;
      seacrch(Value);
    }

    update();
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
    IsSortHightsDiscount = value;
    isCheckBoxActiveOffers = false;
    isCheckBoxActivePrices = true;
    update();
  }

  @override
  @override
  void onInit() {
    Catid = settingservices.sharedPref.getString("selectedCat")!;
    Districtid = settingservices.sharedPref.getString("selecteddisc");
    print(favoriteMap);

    // item = Get.arguments['itemmodel'];
    // data = Get.arguments['data'];

    Getdata(Catid);

    super.onInit();
  }
}
