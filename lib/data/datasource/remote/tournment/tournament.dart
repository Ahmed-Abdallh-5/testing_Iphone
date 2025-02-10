import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class GetTournment {
  CRUD crud;
  GetTournment(this.crud);
  Settingservices settingservices = Get.find();
  Getmymatches() async {
    var response = await crud.getdata(APPlinks.tournament, {},
        token: await settingservices.storage.read(key: 'token'));
    return response.fold((l) => l, (r) => r);
  }
}
