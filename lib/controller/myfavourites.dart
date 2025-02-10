// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/data/datasource/remote/myfavourite.dart';
// import 'package:get/get.dart';

// abstract class MyFavourite extends GetxController {
//   Getdata();
// }

// class MyFavouriteimple extends MyFavourite {
//   MyFavourites myFavourites = MyFavourites(Get.find());
//   Settingservices settingservices = Get.find();
//   List myfavouritelist = [];
//   StatueRequest? statueRequest;

//   Getdata() async {
//     statueRequest = StatueRequest.loading;
//     update();
//     var response = await myFavourites.getmyfavourite(
//       settingservices.sharedPref.getString("userid")!,
//     );
//     statueRequest = handlingdata(response);
//     if (StatueRequest.Success == statueRequest) {
//       print(response);

//       if (response["status"] == 'success') {
//         myfavouritelist.addAll(response['data']);
//         update();
//       } else {}

//       update();
//     }
//   }

//   @override
//   void onInit() {
//     intialdata();
//     super.onInit();
//   }

//   intialdata() {
//     Getdata();
//     update();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
