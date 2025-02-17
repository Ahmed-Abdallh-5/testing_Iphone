import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallofferscon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/previousprice.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewallOffers extends GetView<Homeimp2> {
  const ListViewallOffers(
      {super.key, required this.viewallOffersimble, this.items});
  final ViewallOffersimble? viewallOffersimble;
  final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.55,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: viewallOffersimble!.offers.length,
          itemBuilder: (context, index) {
            return ItemsModelClassViewall(
              offeredcontainer: true,
              items: ItemModelJson.fromJson(viewallOffersimble!.offers[index]),
            );
          }),
    );
  }
}

// class ItemsModelClass extends GetView<Homeimp2> {
//   const ItemsModelClass({super.key, this.items});
//   final ItemModelJson? items;

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     ViewallOffersimble viewallOffersimble = Get.put(ViewallOffersimble());
//     Homeimp2 homeimp2 = Get.put(Homeimp2());

//     return InkWell(
//       onTap: () {
//         viewallOffersimble!.gotoproductdetails(items);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: screenHeight * .17,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: AppConstans.Bordercolor)),
//           child: Row(
//             children: [
//               Stack(children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                     screenWidth * 0.02,
//                   ),
//                   child: Container(
//                     height: screenHeight * .17,
//                     width: screenWidth * 0.37,
//                     child: Image.asset(
//                       "images/padel sport.jpg",
//                       fit: BoxFit.fill,
//                     ),
//                   ), Positioned(
//                   bottom: 0,
//                   left: -5,
//                   child: Container(
//                     height: 24,
//                     width: 80,
//                     decoration: BoxDecoration(
//                         color: AppConstans.themecolor,
//                         borderRadius: BorderRadius.circular(16)),
//                     child: Center(
//                         child: Text(
//                       "${items!.discount}% Off",
//                       style: TextStyleClass.getTextStyle("weight500", 14,
//                           color: AppConstans.Whitecolor),
//                     )),
//                   ),
//                 )
//                 ),
//                
//               ]),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               translationDataBase(items!.nameAr!, items!.name!),
//                               style: TextStyleClass.getTextStyle(
//                                 "medium",
//                                 screenWidth * 0.055,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           GetBuilder<Homeimp2>(
//                               builder: (homeimp2) => IconButton(
//                                   onPressed: () {
//                                     if (homeimp2.favoriteMap[items!.id] ==
//                                         true) {
//                                       homeimp2.removefromfavourie(items!.id);
//                                       homeimp2.changestatefavourite(
//                                           items!.id, false);
//                                     } else {
//                                       homeimp2.addtofavourite(
//                                           items!.id, items!.name, items!.price);
//                                       homeimp2.changestatefavourite(
//                                           items!.id, true);
//                                     }
//                                   },
//                                   icon: homeimp2.favoriteMap[items!.id] == true
//                                       ? Icon(
//                                           Icons.favorite,
//                                           color: AppConstans.themecolor,
//                                         )
//                                       : Icon(
//                                           Icons.favorite_border,
//                                           color: AppConstans.themecolor,
//                                         )))
//                         ],
//                       ),
//                       // Row(
//                       //   children: [
//                       //     Icon(
//                       //       Icons.star,
//                       //       color: Colors.yellow,
//                       //       size: screenWidth * 0.060,
//                       //     ),
//                       //     Text(
//                       //       items!.rating == null ? "74".tr : items!.rating!,
//                       //       style: TextStyle(
//                       //         fontWeight: FontWeight.w500,
//                       //         fontSize: screenWidth * 0.040,
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       Row(
//                         children: [
//                           // Icon(
//                           //   Icons.location_on_outlined,
//                           //   color: Colors.grey,
//                           //   size: screenWidth * 0.048,
//                           // ),
//                           // SizedBox(
//                           //   width: screenWidth * 0.009,
//                           // ),
//                           Expanded(
//                             child: Text(
//                               items!.location!,
//                               style: TextStyleClass.getTextStyle(
//                                   "weight500", screenWidth * 0.035,
//                                   color: AppConstans.darkgreycolor),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Row(
//                         children: [
//                           Text(
//                             "${items!.price!} L.E/hour",
//                             style: TextStyleClass.getTextStyle(
//                                 "weight500", AppConstans.Width * .04,
//                                 color: AppConstans.themecolor),
//                             textAlign: TextAlign.right,
//                           ),
//                           // Text(
//                           //   "${items!.price!}" + "76".tr,
//                           //   style: TextStyle(
//                           //     fontWeight: FontWeight.bold,
//                           //     fontSize: screenWidth * 0.048,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
