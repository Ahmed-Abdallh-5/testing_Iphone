// import 'package:ecommerce/controller/home2.dart';
// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';

// import 'package:ecommerce/data/datasource/remote/favourite.dart';
// import 'package:ecommerce/data/datasource/remote/myfavourite.dart';
// import 'package:get/get.dart';

// abstract class Favourie extends GetxController {
//   // removefromfavourie(itemsid);
//   Getdata();
//   gotoproductdetails(items);
// }

// class Favouriteimple extends Favourie {
//   StatueRequest? statueRequest;

//   MyFavourites myfavourite = MyFavourites(Get.find());
//   List MyFavouriteList = [];
//   @override
//   Getdata() async {
//     statueRequest = StatueRequest.loading;
//     update();
//     var response = await myfavourite.getmyfavourite();
//     statueRequest = handlingdata(response);
//     update();
//     if (statueRequest == StatueRequest.Success) {
//       MyFavouriteList.addAll(response['data']);
//     } else {
//       statueRequest = StatueRequest.ServerFaliure;
//     }
//   }

//   removeFromFavouriteList(itemsid) {
//     MyFavouriteList.removeWhere((item) => item['id'] == itemsid);
//     update();
//   }

//   @override
//   removefromfavourie(itemsid) async {
//     statueRequest = StatueRequest.loading;
//     update();
//     var response = await myfavourite.RemoveFromFavourite(itemsid);
//     statueRequest = handlingdata(response);

//     if (statueRequest == StatueRequest.Success) {
//       if (response['message'] ==
//           'Item has been removed successfully from favorites') {
//         // Remove the item from the MyFavouriteList
//         MyFavouriteList.removeWhere((item) => item['id'] == itemsid);
//         Homeimp2 homeimp2 = Get.put(Homeimp2());
//         homeimp2.changestatefavourite(itemsid, false);
//         update(); // Trigger a rebuild of the UI
//         Get.defaultDialog(title: "..", middleText: "Deleted From favourite");
//       } else {
//         // Handle the case where the deletion was not successful
//       }
//     } else {
//       statueRequest = StatueRequest.ServerFaliure;
//     }
//   }

//   addToFavouriteList(itemsid, itemname, int price) {
//     // Check if the item is already in the list
//     bool isItemInList = MyFavouriteList.any((item) => item['id'] == itemsid);

//     if (!isItemInList) {
//       MyFavouriteList.add({'id': itemsid, 'name': '$itemname', 'price': price});
//     }
//   }

//   gotoproductdetails(items) {
//     Homeimp2 homeimp2 = Get.put(Homeimp2());
//     Get.toNamed("/productsdetails",
//         arguments: {"itemmodel": items, 'map': homeimp2.favoriteMap});
//   }

//   @override
//   void onInit() {
//     Getdata();

//     super.onInit();
//   }
// }
