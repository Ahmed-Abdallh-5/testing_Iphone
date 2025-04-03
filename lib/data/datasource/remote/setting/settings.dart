import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class SettingFunction {
  CRUD crud;
  SettingFunction(this.crud);
  Settingservices settingservices = Get.find();

  Logout() async {
    var response = await crud.postdata(APPlinks.logout, {},
        token: await settingservices.sharedPref.getString("token"));

    return response.fold((l) => l, (r) => r);
  }

  Deletefun(
    String password,
  ) async {
    var response = await crud.deleteData(
        APPlinks.deleteaccount,
        {
          "password": password,
        },
        token: await settingservices.sharedPref.getString("token"));

    return response.fold((l) => l, (r) => r);
  }
}
