import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class HomeDate {
  CRUD crud;
  HomeDate(this.crud);
  Settingservices settingservices = Get.find();
  getdata() async {
    var response = await crud.getdata(APPlinks.ChooseCountry, {},
        token: await settingservices.sharedPref.getString("token"));
    return response.fold((l) => l, (r) => r);
  }

  getsubdata(String id) async {
    final String url =
        '${APPlinks.ChooseCountry}/$id'; // Append the ID to the base URL
    var response = await crud.getdata(url, {},
        token: await settingservices.sharedPref.getString("token"));
    return response.fold((l) => l, (r) => r);
  }
}
