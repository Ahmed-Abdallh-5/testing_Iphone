// import 'package:ecommerce/controller/favourite.dart';
// import 'package:ecommerce/controller/home.dart';
// import 'package:ecommerce/controller/home2.dart';
// import 'package:ecommerce/controller/myfavourites.dart';
// import 'package:ecommerce/core/constans/colors.dart';
// import 'package:ecommerce/core/constans/links.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/data/model/itemsmodel.dart';
// import 'package:ecommerce/data/model/myfavouritemodel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// class MyFavourotelistView extends GetView<Homeimp> {
//   const MyFavourotelistView({super.key, required this.myFavouriteimple});
//   final Favouriteimple myFavouriteimple;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 350,
//       child: GetBuilder<Favouriteimple>(
//         builder: (myFavouriteimple) => Expanded(
//           child: CustomScrollView(
//             scrollDirection: Axis.vertical,
//             slivers: <Widget>[
//               SliverGrid(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     return ItemsModel(
//                       myFavouriteModel: MyFavouriteModel.fromJson(
//                         myFavouriteimple.MyFavouriteList[index],
//                       ),
//                     );
//                   },
//                   childCount: myFavouriteimple.MyFavouriteList.length,
//                 ),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ItemsModel extends GetView<MyFavouriteModel> {
//   const ItemsModel({super.key, this.myFavouriteModel});
//   final MyFavouriteModel? myFavouriteModel;

//   @override
//   Widget build(BuildContext context) {
//     Favouriteimple myFavouriteimple = Get.put(Favouriteimple());
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     double cardWidth = screenWidth *
//         0.45; // Set the desired card width (e.g., 45% of screen width)
//     double cardHeight = screenHeight *
//         0.35; // Set the desired card height (e.g., 35% of screen height)

//     return Expanded(
//       child: InkWell(
//         child: Container(
//           width: cardWidth, // Set the container width
//           height: cardHeight, // Set the container height
//           child: Card(
//             elevation:
//                 Theme.of(context).brightness == ThemeData.dark() ? 0.118 : 3,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: cardHeight *
//                       0.65, // Set the image container height to 65% of the card height
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(
//                       "images/padel park.jpg",
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Row(
//                     children: [
//                       Text(
//                         myFavouriteModel!.name!,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: "Helvetica",
//                         ),
//                       ),
//                       Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           myFavouriteimple!
//                               .removefromfavourie(myFavouriteModel!.id);
//                         },
//                         icon: Icon(Icons.delete),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       bottom: cardHeight *
//                           0.05), // Set the bottom padding to 5% of the card height
//                   child: Row(
//                     children: [
//                       Text(
//                         "${myFavouriteModel!.price} L.E/hour",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
