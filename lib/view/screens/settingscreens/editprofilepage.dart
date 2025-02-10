// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/controller/settingcon/editprofilecontroller.dart';
// import 'package:ecommerce/core/constans/constansappvalues.dart';
// import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
// import 'package:ecommerce/core/funtions/showbottomsheet.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
// import 'package:ecommerce/view/widget/settingwidget/conatinerphoto.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EditProfile extends StatelessWidget {
//   const EditProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     EditProfileImple editProfileImple = Get.put(EditProfileImple());
//     Settingservices settingservices = Get.find();

//     return GetBuilder<EditProfileImple>(
//         builder: (editProfileImple) => Scaffold(
//               appBar: AppBar(
//                 title: Text(
//                   "103".tr,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 centerTitle: true,
//                 leading: IconButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: Icon(Icons.arrow_back_ios)),
//               ),
//               body: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: AppConstans.PaddingHorizontalAuth),
//                 child: ListView(
//                   children: [
//                     SizedBox(
//                       height: AppConstans.Hight * .01,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Stack(children: [
//                             settingservices.sharedPref.getBool(
//                                         "${editProfileImple.isimagechosen}") ==
//                                     false
//                                 ? CircleContainerImage(
//                                     image: CachedNetworkImageProvider(
//                                         '${settingservices.sharedPref.getString('photo')}'))
//                                 : CircleContainerImage(
//                                     image: FileImage(editProfileImple.image!)),
//                             Positioned(
//                                 left: 100,
//                                 bottom: 0,
//                                 child: editProfileImple.isimagechosen == false
//                                     ? ShowBottomBar(
//                                         camera: editProfileImple.PickFromCamera,
//                                         gallery:
//                                             editProfileImple.PickFromGallery,
//                                       )
//                                     : Container(
//                                         height: 35,
//                                         width: 35,
//                                         decoration: BoxDecoration(
//                                             color: AppConstans.themecolor,
//                                             shape: BoxShape.circle),
//                                         child: Center(
//                                           child: IconButton(
//                                             onPressed: () {
//                                               editProfileImple.uploadimage();
//                                             },
//                                             icon: Icon(Icons.check),
//                                             iconSize: 22,
//                                             color: AppConstans.Whitecolor,
//                                           ),
//                                         ),
//                                       ))
//                           ]),
//                         ),
//                         SizedBox(
//                           height: AppConstans.Hight * .055,
//                         ),
//                         Text(
//                           "104".tr,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         SizedBox(
//                           height: AppConstans.Hight * .015,
//                         ),
//                         Padding(
//                           padding:
//                               EdgeInsets.only(left: AppConstans.Width * .02),
//                           child: Text(
//                             "105".tr,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.grey),
//                           ),
//                         ),
//                         SizedBox(
//                           height: AppConstans.Hight * .0055,
//                         ),
//                         Textformfield(
//                             onFieldSubmitted: (Value) {
//                               if (!GetUtils.isUsername(Value) ||
//                                   Value == int ||
//                                   Value == double) {
//                                 Get.snackbar("106".tr, "107".tr);
//                                 // Get.defaultDialog(
//                                 //   radius: 20,
//                                 //   title: "106".tr,
//                                 //   titleStyle:
//                                 //       TextStyle(fontWeight: FontWeight.w500),
//                                 //   middleText: "107".tr,
//                                 // );
//                               } else {
//                                 editProfileImple.ChangeUsername(Value);
//                                 Get.snackbar("Success", "108".tr);
//                                 // Get.defaultDialog(
//                                 //   radius: 20,
//                                 //   title: "108".tr,
//                                 //   titleStyle:
//                                 //       TextStyle(fontWeight: FontWeight.w500),
//                                 // );
//                               }
//                             },
//                             iconsuffix: null,
//                             validatorfunc: (val) {
//                               return valditor(
//                                   val!, val!.length, val!.length, "username");
//                             },
//                             textEditingController: editProfileImple.username,
//                             textInputType: TextInputType.name,
//                             hinttextstring: "109".tr,
//                             icon: Icon(
//                               Icons.person_2_outlined,
//                               color: AppConstans.IconColor,
//                             )),
//                         SizedBox(
//                           height: AppConstans.Hight * .015,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: AppConstans.Hight * .08,
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
