import 'package:get/get.dart';

class Checkout extends GetxController {}

class Checkoutimble extends Checkout {
  String? url;

  @override
  void onInit() {
    url = Get.arguments['url'];
    print(url);
    super.onInit();
  }
}
