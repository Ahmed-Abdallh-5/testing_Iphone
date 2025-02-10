// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/data/datasource/remote/rateitem.dart';
// import 'package:ecommerce/data/model/itemsmodel.dart';
// import 'package:get/get.dart';

// abstract class Reviewscon extends GetxController {
//   sendreview(itemsid, double rating);
// }

// class Reviewsconimble extends Reviewscon {
//   late ItemModelJson items;
//   ReviewItem reviewItem = ReviewItem(Get.find());
//   StatueRequest? statueRequest;
//   @override
//   sendreview(itemsid, double rating) async {
//     statueRequest = StatueRequest.loading;
//     update();
//     var resposnse = await reviewItem.RateItem(itemsid, rating.toInt());
//     statueRequest = handlingdata(resposnse);
//     if (statueRequest == StatueRequest.Success) {
//       print(resposnse);
//       print('Rating: ${rating.toInt()}');
//     } else {
//       print("errror");
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     // items = Get.arguments['items'];

//     super.onInit();
//   }
// }
