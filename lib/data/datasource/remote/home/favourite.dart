import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class Favourites {
  CRUD crud;
  Favourites(this.crud);
  Settingservices settingservices = Get.find();
  addtoFavourite(itemsid) async {
    var response = await crud.postdata(
        APPlinks.addFavourite,
        {
          'id': itemsid,
        },
        token: await settingservices.storage.read(key: 'token'));
    return response.fold((l) => l, (r) => r);
  }

  RemoveFromFavourite(itemsid) async {
    Map<String, dynamic> params = {
      'id': itemsid,
    };
    var response = await crud.deleteData(APPlinks.removwFavourite, params,
        token: await settingservices.storage.read(key: 'token'));
    return response.fold((l) => l, (r) => r);
  }
}
