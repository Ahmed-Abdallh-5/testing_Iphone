// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/data/datasource/remote/testdata.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/core/classes/crud.dart';

// class Testcontroller extends GetxController {
//   Testdata testdata = Testdata(Get.find());
//   List data = [];
//   late StatueRequest statueRequest;

//   Future<void> getdata() async {
//     statueRequest = StatueRequest.loading;

//     var response = await testdata.getdata();
//     statueRequest = handlingdata(response);
//     if (StatueRequest.Success == statueRequest) {
//       if (response["status"] == 'success') {
//         data.addAll(response['data']);
//       } else {
//         statueRequest = StatueRequest.logicfaliure;
//       }
//     }

//     update();
//     // Add this line
//   }

//   @override
//   void onInit() {
//     getdata();
//     super.onInit();
//   }
// }
