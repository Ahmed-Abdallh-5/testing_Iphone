import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/home/favourite.dart';
import 'package:ecommerce/data/datasource/remote/booking/bookitem.dart';
import 'package:ecommerce/data/datasource/remote/booking/getavilablehours.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class ProductDetailsController extends GetxController {
  Getdata();

  // pickdate(BuildContext context);

  GiveReview(itemsid, double rating) {}
  addtofavourite(itemsid, name, pricee);
  removefromfavourie(itemsid);
  changestatefavourite(id, Value);

  // SearchForfreetimes(itemid);
}

class ProductDetailsConimble extends ProductDetailsController {
  late ItemModelJson items;

  Booking bookink = Booking(Get.find());
  String? padelnumber;

  int activeindex = 0;
  BookingHours bookingHours = BookingHours(Get.find());

  Favourites favourite = Favourites(Get.find());
  StatueRequest? statueRequest;
  List AvilableHoursList = [];
  Map favoriteMap = {};
  Settingservices settingservices = Get.find();
  int? rateint;

  List ChosenHoursList = [];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool? isviewallpage;
  String? BookingUrl;
  List<bool> isClickedList = [];
  List<bool> isappointemntclicked = [];
  bool? isvourtselected = false;
  List chosenCourts = [];
  String? chosencourtid;
  List nameListid = [];
  String? formattedDate;
  // DateTime? dateTime;
  String? dateOnly;
  @override
  GetAvilableHours(String subitem, String dateTime) async {
    isappointemntclicked =
        List.generate(AvilableHoursList.length, (index) => false);
    print(isappointemntclicked);
    if (formkey.currentState!.validate()) {
      statueRequest = StatueRequest.loading;
      update();
      var response = await bookingHours.getavilableHours(dateTime, subitem);
      statueRequest = handlingdata(response);
      if (statueRequest == StatueRequest.Success) {
        AvilableHoursList.clear();
        AvilableHoursList.addAll(response['data']);
        print("Ya RAB NA5LAS");
        print(subitem);
        print(AvilableHoursList);
        isappointemntclicked =
            List.generate(AvilableHoursList.length, (index) => false);
        print(isappointemntclicked);
        print("dgdgsrefewiru3298274197");

        // print(AvilableHoursList);
        update();
        // Get.toNamed("/avilableHoursScreen",
        //     arguments: {"list": AvilableHoursList, "itemmodel": items});
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

  void GotoCheckoutscreen() {
    Get.toNamed("/checkoutscreen", arguments: {
      'subitemid': chosencourtid,
      'subitemname': chosenCourts,
      'bookedhours': ChosenHoursList,
      'itemmodel': items,
      'datetime': dateOnly,
      'formatteddate': formattedDate
    });
  }

  clearchosenhours() {
    ChosenHoursList.clear();
    update();
  }

  void initializeList() {
    isClickedList = List.generate(items.courts!.length, (index) => false);
  }

  void ischosen(int index) {
    for (int i = 0; i < isClickedList.length; i++) {
      isClickedList[i] = i == index; // Set true only for the clicked index
    }

    chosenCourts
      ..clear() // Clear the previous selection
      ..add(translationDataBase(items.courts![index].name,
          items.courts![index].name)); // Add the currently selected court

    // Debugging: Print the selected courts
    update(); // Notify GetBuilder of the changes
  }

  isAppointmentchosen(int Appointmnetindex) {
    isappointemntclicked[Appointmnetindex] =
        !isappointemntclicked[Appointmnetindex]; // عكس القيمة
    update(); // تحديث الواجهة
  }

  void RemoveFromBookedlist(String value) {
    if (ChosenHoursList.contains(value)) {
      ChosenHoursList.removeWhere((item) => item == value);
    }
    update();
  }

  void AddtoBookedlist(String value) {
    if (ChosenHoursList.contains(value)) {}
    if (ChosenHoursList.length >= 2) {
      Get.snackbar(
        "377".tr,
        "378".tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode
            ? AppConstans.maincolorlighttheme
            : AppConstans.maincolorlighttheme,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    ChosenHoursList.add(value);
    update();
  }

  @override
  onPageChanged(index, reason) {
    activeindex = index;
    update();
  }

  Getdata() {
    items = Get.arguments['itemmodel'];
    favoriteMap = Get.arguments['map'];
    print(favoriteMap);
  }

  @override
  void onInit() {
    dateOnly = DateFormat('yyyy-MM-dd').format(DateTime.now());
    formattedDate =
        DateFormat('MMM dd, yyyy', settingservices.sharedPref.getString("lang"))
            .format(DateTime.now());

    print(dateOnly);
    Getdata();

    initializeList();
    print(isClickedList);
    super.onInit();
  }

  changestatefavourite(id, Value) {
    favoriteMap[id] = Value;
    update();
  }

  @override
  addtofavourite(itemsid, name, pricee) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await favourite.addtoFavourite(itemsid);
    statueRequest = handlingdata(response);

    if (statueRequest == StatueRequest.Success) {
      if (response['message'] ==
          'Item has been added successfully to favorites') {
        MyaccountConimble favourite = Get.put(MyaccountConimble());
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
  removefromfavourie(itemsid) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await favourite.RemoveFromFavourite(itemsid);
    statueRequest = handlingdata(response);
    print(response);
    update();
    if (statueRequest == StatueRequest.Success) {
      if (response['message'] ==
          'Item has been removed successfully from favorites') {
        Get.defaultDialog(title: "..", middleText: "Deleted From favourite");
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
}
