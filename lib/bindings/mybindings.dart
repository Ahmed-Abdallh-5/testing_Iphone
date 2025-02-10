import 'package:ecommerce/core/classes/crud.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CRUD());
  }
}
