// import 'package:ecommerce/controller/favourite.dart';
// import 'package:ecommerce/view/screens/myfavouriteslistview.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Favouriteimple myFavouriteimple = Get.put(Favouriteimple());
//     double ScreenWidth = MediaQuery.of(context).size.width;
//     double ScreenHight = MediaQuery.of(context).size.height;
//     return GetBuilder<Favouriteimple>(
//       builder: (myFavouriteimple) => Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: Text(
//             "My Favourite",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: myFavouriteimple.MyFavouriteList.length == 0
//             ? Center(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: ScreenHight * .3,
//                     ),
//                     Icon(
//                       Icons.favorite,
//                       size: 100,
//                       color: Colors.grey,
//                     ),
//                     Text(
//                       "Go forth and search!",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
//                     ),
//                     Text(
//                       "once you add to favourite it will show up here!",
//                       style: TextStyle(fontSize: 18),
//                     )
//                   ],
//                 ),
//               )
//             : Column(
//                 children: [
//                   Expanded(
//                     child: MyFavourotelistView(
//                       myFavouriteimple: myFavouriteimple,
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
