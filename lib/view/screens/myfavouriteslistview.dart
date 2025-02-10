import 'package:ecommerce/controller/account/accountcon.dart';

import 'package:ecommerce/controller/homecon/homecon.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';

import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavourotelistView extends GetView<Homeimp2> {
  const MyFavourotelistView({super.key, required this.myaccountCon});
  final MyaccountConimble myaccountCon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: GetBuilder<MyaccountConimble>(
          builder: (myaccountCon) => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: myaccountCon.MyFavouriteList.length,
              itemBuilder: (context, index) {
                return ItemsModelClassViewall(
                    items: ItemModelJson.fromJson(
                        myaccountCon.MyFavouriteList[index]));
              }),
        ));
  }
}

// class ItemsModel extends GetView<MyFavouriteModel> {
//   const ItemsModel({super.key, this.items});

//   final ItemModelJson? items;
//   @override
//   Widget build(BuildContext context) {
//     Favouriteimple myFavouriteimple = Get.put(Favouriteimple());
//     double ScreenWidth = MediaQuery.of(context).size.width;
//     double ScreenHight = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: EdgeInsets.only(
//           top: ScreenHight * .01,
//           right: ScreenWidth * .02,
//           left: ScreenWidth * .02),
//       child: InkWell(
//         onTap: () {
//           myFavouriteimple.gotoproductdetails(items);
//         },
//         child: Card(
//           elevation:
//               Theme.of(context).brightness == ThemeData.dark() ? .118 : 3,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: ScreenHight * .25,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.asset(
//                     "images/padel park.jpg",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8),
//                 child: Row(
//                   children: [
//                     Text(
//                       items!.name!,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontFamily: "Helvetica",
//                       ),
//                     ),
//                     Spacer(),
//                     IconButton(
//                       onPressed: () {
//                         myFavouriteimple!.removefromfavourie(items!.id);
//                       },
//                       icon: Icon(Icons.delete),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(bottom: ScreenHight * .02),
//                 child: Row(
//                   children: [
//                     Text(
//                       "${items!.price}" + " L.E/hour",
//                       style: TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
