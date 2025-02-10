import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallitemcontroller.dart';

import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallgeneralcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewallItemsSorting extends GetView<Homeimp2> {
  const ListViewallItemsSorting(
      {super.key, required this.viewallitemsimble, this.items});
  final ViewallItemsimble? viewallitemsimble;
  final ItemModelJson? items;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.49,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: viewallitemsimble!.SortedList.length,
          itemBuilder: (context, index) {
            return ItemsModelClassViewall(
              items:
                  ItemModelJson.fromJson(viewallitemsimble!.SortedList[index]),
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
//     ViewallItemsimble viewallItemsimble = Get.put(ViewallItemsimble());
//     Homeimp2 homeimp2 = Get.put(Homeimp2());

//     return InkWell(
//       onTap: () {
//         viewallItemsimble.gotoproductdetails(items);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: AppConstans.Hight * .17,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: AppConstans.Bordercolor)),
//           child: Row(
//             children: [
//               Stack(children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(AppConstans.Width * 0.02),
//                   child: Container(
//                     height: AppConstans.Hight * .17,
//                     width: AppConstans.Width * 0.37,
//                     child: Image.asset(
//                       "images/padel sport.jpg",
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ]),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               translationDataBase(items!.nameAr!, items!.name!),
//                               style: TextStyleClass.getTextStyle(
//                                 "medium",
//                                 AppConstans.Width * 0.055,
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
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               items!.location!,
//                               style: TextStyleClass.getTextStyle(
//                                   "weight500", AppConstans.Width * 0.035,
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
//                           // Text(
//                           //   "",
//                           //   style: TextStyle(
//                           //     fontWeight: FontWeight.bold,
//                           //     fontSize: screenWidth * 0.048,
//                           //   ),
//                           // ),
//                           Text(
//                             "${items!.price!} L.E/hour",
//                             style: TextStyleClass.getTextStyle(
//                                 "weight500", AppConstans.Width * .04,
//                                 color: AppConstans.themecolor),
//                             textAlign: TextAlign.right,
//                           ),
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
