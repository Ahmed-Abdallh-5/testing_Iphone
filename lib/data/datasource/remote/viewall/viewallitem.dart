import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class HomeDate2Viewallitems {
  CRUD crud;
  Settingservices settingservices = Get.find();
  HomeDate2Viewallitems(this.crud);

  getdata(String catID) async {
    Map<String, dynamic> params = {'city': catID};

    var response = await crud.getdata(APPlinks.Home2, params,
        token: await settingservices.sharedPref.getString("token"));

    return response.fold((l) => l, (r) => r);
  }

  Searchdata(String catID, name) async {
    Map<String, dynamic> params = {'city': catID, 'search': name};

    var response = await crud.getdata(APPlinks.Home2, params,
        token: await settingservices.sharedPref.getString("token"));

    return response.fold((l) => l, (r) => r);
  }

  sortdata(String catID, sortway) async {
    Map<String, dynamic> params = {'city': catID, 'price': sortway};

    var response = await crud.getdata(APPlinks.Home2, params,
        token: await settingservices.sharedPref.getString("token"));

    return response.fold((l) => l, (r) => r);
  }
}
