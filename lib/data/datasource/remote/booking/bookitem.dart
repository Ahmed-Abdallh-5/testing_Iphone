import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

class Booking {
  CRUD crud;
  Booking(this.crud);
  Settingservices settingservices = Get.find();

  BookItemfunc(court_id, date, hours) async {
    var response = await crud.postdata(
        APPlinks.bookitem, {'court_id': court_id, 'date': date, 'hours': hours},
        token: await settingservices.storage.read(key: 'token'));

    return response.fold((l) => l, (r) => r);
  }
}
