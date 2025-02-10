import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/home/favourite.dart';
import 'package:ecommerce/data/datasource/remote/home/homeData2.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Home2 extends GetxController {
  Getdata(String id);
  gotoproductdetails(items);

  removefromfavourie(itemsid);
  changestatefavourite(id, Value);
  onChanging(Value);
  seacrch(name);
}

// ignore: deprecated_member_use
class Homeimp2 extends Home2 with SingleGetTickerProviderMixin {
  AnimationController? lottieController;
  HomeDate2 homeDate2 = HomeDate2(Get.find());
  Favourites favourite = Favourites(Get.find());
  Settingservices settingservices = Get.find();
  // Rating rating = Rating(Get.find());
  TextEditingController? searchcontroller;
  List images = ["images/🦆 icon _trophy_.png", "images/Layer 2.png"];
  List texts = ["ArenaX\nTournaments", "Special\nOffers"];
  String? Districtid;
  bool? isfavouritevalue;
  bool? isshaerching = false;
  int? selectedindex;
  List data = [];

  List offers = [];
  List Searchlistmodel = [];
  List<ItemModelJson> Searchlist = [];
  late String Catid;
  StatueRequest? statueRequest;
  Map<int, bool> favoriteMap = {};
  // ItemModelJson? itemModelJson;

  List upcoming = [];
  Getdata(id) async {
    statueRequest = StatueRequest.loadinghome;
    update();
    var response = await homeDate2.getdata(id);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      data.addAll(response['data'].where((element) =>
          element['active'] == true && element['discount'] == 0 ||
          element['discount'] != null));
      offers.addAll(response['data'].where(
          (element) => element['active'] == true && element['discount'] != 0));
      for (var item in data) {
        favoriteMap[item['id']] = item['isFavorite'];
      }
      ///////////2 solustions/////////////////////
      // make data == 0 || data =! 0 بس ملهاش لازمة
      // 2-  اني اعمل data اللي مش عليها اوفرز واللي تحت اللي عليه اوفرز

      for (var item in offers) {
        favoriteMap[item['id']] = item['isFavorite'];
      }
      print(favoriteMap);
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
    var response = await homeDate2.getdata(id);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      data.clear();
      offers.clear();
      data.addAll(response['data'].where(
          (element) => element['active'] == true && element['discount'] != 0));
      offers.addAll(response['data'].where(
          (element) => element['active'] == true && element['discount'] != 0));
      for (var item in data) {
        favoriteMap[item['id']] = item['isFavorite'];
      }
      print(favoriteMap);
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
    var response = await homeDate2.Searchdata(Catid, name);
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

  addtofavourite(itemsid, name, pricee) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await favourite.addtoFavourite(itemsid);
    statueRequest = handlingdata(response);
    // print(response);

    if (statueRequest == StatueRequest.Success) {
      if (response['message'] == 'Place added to favorites.') {
        // MyaccountConimble favourite = Get.put(MyaccountConimble());
        // favourite.addToFavouriteList(itemsid, name, pricee);
        update();
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

  @override
  changestatefavourite(id, Value) {
    favoriteMap[id] = Value;

    update();

    // if (Value) {
    //   // MyaccountConimble controller = Get.put(MyaccountConimble());
    // } else {
    //   MyaccountConimble controller = Get.put(MyaccountConimble());
    //   controller.removeFromFavouriteList(id);
    // }
  }

  @override
  removefromfavourie(itemsid) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await favourite.RemoveFromFavourite(itemsid);
    print(response);
    statueRequest = handlingdatatest(response);
    print(response);
    update();
    if (statueRequest == StatueRequest.deletedsuccess) {
      Get.defaultDialog(title: "..", middleText: "Deleted From favourite");
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

  @override
  void onInit() {
    super.onInit();
    intialdata();

    // Initialize the AnimationController
    lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  intialdata() {
    Catid = settingservices.sharedPref.getString("selectedCat")!;
    Districtid = settingservices.sharedPref.getString("selecteddisc");
    // Catid = settingservices.sharedPref.getString("selectedCategoryIdD")!;

    Getdata(Catid);
  }

  @override
  void dispose() {
    lottieController!.dispose();
    super.dispose();
  }

  gotoproductdetailsviewallitems() {
    Get.toNamed("/viewallItems", arguments: {
      // 'map': favoriteMap,
    });
  }

  gotoproductdetailsviewalloffers() {
    Get.toNamed("/viewallOffersScreen", arguments: {
      // 'map': favoriteMap,
    });
  }

  gotoproductdetails(items) {
    Get.toNamed("/productsdetails",
        arguments: {"itemmodel": items, 'map': favoriteMap});
  }
}
