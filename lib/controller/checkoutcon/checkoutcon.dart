import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/booking/bookitem.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';

import 'package:get/get.dart';

abstract class Checkoutcon extends GetxController {
  Bookitem(subitemid, dateTimee, List hours);
}

class Checkoutconimble extends Checkoutcon {
  String? maintitle;
  List? secondtitle;
  String? thirdtitle;
  String? Subthirdtitle;
  List? fourthtitle;
  StatueRequest? statueRequest;
  Booking booking = Booking(Get.find());
  String? BookingUrl;
  late ItemModelJson item;
  String? subid;
  String? dateTime;
  String? formatteddateTime;

  Bookitem(subitemid, dateTimee, List hours) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await booking.BookItemfunc(subitemid, dateTimee, hours);
    statueRequest = handlingdata(response);
    if (statueRequest == StatueRequest.Success) {
      if (response['message'] == "Redirect the user to this url") {
        BookingUrl = response['url'];
        Get.toNamed('/checkoutScreen', arguments: {'url': BookingUrl});
      }
    } else {
      statueRequest == StatueRequest.ServerFaliure;
      Get.defaultDialog(title: "unexpected error", middleText: "");
    }
    update();
  }

  @override
  void onInit() {
    subid = Get.arguments['subitemid'];
    secondtitle = Get.arguments['subitemname'];
    // thirdtitle = Get.arguments[''];
    fourthtitle = Get.arguments['bookedhours'];
    item = Get.arguments['itemmodel'];
    dateTime = Get.arguments['datetime'];
    formatteddateTime = Get.arguments['formatteddate'];
    print(subid);
    print(fourthtitle);
    print(dateTime);

    // print(formatteddateTime);
    // print(subid);
    // print(secondtitle);
    // // print(thirdtitle);
    // print(dateTime);
    // // print(fourthtitle);

    super.onInit();
  }
}
