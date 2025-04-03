import 'package:ecommerce/controller/checkoutcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

Checkoutimble checkoutimble = Get.put(Checkoutimble());

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(checkoutimble.url!));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Appbartext(appbartext: "Payment"),
          leading: Padding(
            padding: EdgeInsets.only(left: AppConstans.PaddingHorizontalAuth),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
        ),
        body: WebViewWidget(controller: controller));
  }
}
