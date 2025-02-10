import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class BookingHours {
  CRUD crud;
  BookingHours(this.crud);
  Settingservices settingservices = Get.find();

  getavilableHours(
    String date,
    String courtid,
  ) async {
    Map<String, dynamic> params = {
      'date': date,
    };

    var response = await crud.getdata(
        APPlinks.getavilablehours + "/${courtid}", params,
        token: await settingservices.storage.read(key: 'token'));
    print(APPlinks.getavilablehours + "/${courtid}");

    return response.fold((l) => l, (r) => r);
  }
}
