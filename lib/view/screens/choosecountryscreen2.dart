// import 'package:ecommerce/controller/choosecountrycont.dart';
// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/constans/colors.dart';
// import 'package:ecommerce/core/funtions/translationdatabase.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/view/widget/Dropdownsearch.dart';
// import 'package:ecommerce/view/widget/handlingviewviewall.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ChooseCounteyScreen extends StatelessWidget {
//   const ChooseCounteyScreen({super.key, this.Selectedcat});

//   final int? Selectedcat;

//   @override
//   Widget build(BuildContext context) {
//     ChosseCountryimple chosseCountryimple = Get.put(ChosseCountryimple());
//     Settingservices settingservices = Get.find();
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: RefreshIndicator(
//         onRefresh: () async {
//           await chosseCountryimple.Refreshindicatorfunc();
//         },
//         child: GetBuilder<ChosseCountryimple>(
//           builder: (chosseCountryimple) => chosseCountryimple.statueRequest ==
//                   StatueRequest.loadinghome
//               ? HandlingView()
//               : Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: screenWidth * 0.04,
//                         right: screenWidth * 0.04,
//                         top: screenHeight * .3),
//                     child: ListView(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Select a governorate",
//                           style:
//                               TextStyle(fontSize: 20, color: Colors.blueGrey),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//                         DropDownWidegt(
//                           countries: translationDataBase(
//                               chosseCountryimple.categorisAR,
//                               chosseCountryimple.categoris),
//                           hintText: "Ex: Alexandria",
//                           onChanged: (Value, index) {
//                             final Selectedcat =
//                                 chosseCountryimple.categoris.indexOf(Value!);
//                             print(Selectedcat);
//                             // print(Value);
//                             final selectedCategoryId =
//                                 chosseCountryimple.categorisIds[index];
//                             print(selectedCategoryId);

//                             // settingservices.sharedPref.setString(
//                             //     "selectedCategoryIdD", selectedCategoryId);
//                             // settingservices.sharedPref
//                             //     .getString("selectedCategoryIdD")!;
//                             settingservices.sharedPref
//                                 .setString("countryname", Value);
//                             settingservices.sharedPref.setInt("Selectedcat",
//                                 chosseCountryimple.categoris.indexOf(Value));
//                             // chosseCountryimple.gotohomescreen(
//                             //     chosseCountryimple.categoris,
//                             //     Selectedcat,
//                             //     selectedCategoryId);
//                           },
//                         ),
//                         SizedBox(
//                           height: screenHeight * .43,
//                         ),
//                         Container(
//                           color: Appcolor.Whitecolor,
//                           child: Row(
//                             children: [
//                               settingservices.sharedPref
//                                           .getString("countryname") ==
//                                       null
//                                   ? Text(
//                                       "Please select a governorate to continue",
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.blueGrey),
//                                     )
//                                   : Text(
//                                       settingservices.sharedPref
//                                           .getString("countryname")!,
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.grey.shade800,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                               Spacer(),
//                               MaterialButton(
//                                   minWidth: 50,
//                                   height: 50,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50)),
//                                   color: Theme.of(context).brightness ==
//                                           ThemeMode.dark
//                                       ? Colors.white
//                                       : Colors.black,
//                                   onPressed: () {
//                                     if (settingservices.sharedPref
//                                             .getString("countryname") !=
//                                         null) {
//                                       chosseCountryimple.gotohomescreen(
//                                           chosseCountryimple.categoris,
//                                           settingservices.sharedPref
//                                               .getInt("Selectedcat")!);
//                                     } else {
//                                       return;
//                                     }
//                                   },
//                                   child: Icon(
//                                     Icons.arrow_forward_ios,
//                                     color: Theme.of(context).brightness ==
//                                             ThemeMode.dark
//                                         ? Colors.black
//                                         : Colors.white,
//                                   ))
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
