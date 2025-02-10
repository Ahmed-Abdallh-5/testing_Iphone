// import 'dart:io';
// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/data/datasource/remote/editprofile.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as img;

// abstract class EditProfileClass extends GetxController {
//   uploadimage();
//   PickFromCamera();
//   PickFromGallery();
// }

// class EditProfileImple extends EditProfileClass {
//   var ImageOnServer;
//   File? image;
//   late TextEditingController username;
//   ImagePicker imagepicker = ImagePicker();
//   StatueRequest? statueRequest;
//   late TextEditingController phone;
//   EditProfile editProfile = EditProfile(Get.find());
//   Settingservices settingservices = Get.find();
//   String? UploadedImage;
//   bool isimagechosen = false;

//   @override
//   @override
//   ChangeUsername(val) async {
//     statueRequest = StatueRequest.loading;
//     update();
//     var response = await editProfile.edituser(val);

//     statueRequest = handlingdata(response);
//     if (StatueRequest.Success == statueRequest) {
//       print(response);
//       if (response['message'] == 'Name has been changed successfully.') {
//         settingservices.sharedPref.setString('username', username.text);
//       }
//     } else {}
//     update();
//   }

//   Future<File> CompressFile(File imagefile) async {
//     img.Image? image = img.decodeImage(imagefile.readAsBytesSync());
//     img.Image resizedimage =
//         img.copyResize(image!, width: image.width, height: image.height);
//     List<int> compreesedbytes = img.encodeJpg(resizedimage, quality: 35);
//     String extenstion = imagefile.path.split('.').last;
//     File CompressedFile = File(imagefile.path.replaceAll(
//       RegExp(r'\.[^\.]+$'),
//       '_compressed.$extenstion',
//     ));
//     CompressedFile.writeAsBytesSync(compreesedbytes);
//     int sizeaftercmpression = CompressedFile.lengthSync().toInt();
//     print("size : $sizeaftercmpression");

//     return CompressedFile;
//   }

//   Setimage(response) {
//     ImageOnServer = response;
//     print(ImageOnServer);
//   }

//   Future uploadimage() async {
//     if (image == null) {
//       return;
//     } else {
//       // String imagepath = image!.path.split("/").last;
//       // String base64 = base64Encode(image!.readAsBytesSync());

//       // print(imagepath);
//       statueRequest = StatueRequest.loading;
//       update();

//       File compressedFile = await CompressFile(image!);
//       print(
//           'Compressed file size: ${compressedFile.lengthSync().toInt()} bytes');
//       var response = await editProfile.uploaduserimage2(compressedFile!);

//       statueRequest = handlingdata(response);
//       if (StatueRequest.Success == statueRequest) {
//         if (response['message'] == "Picture has been uploaded successfully.") {
//           print("object");
//           settingservices.sharedPref.setBool("$isimagechosen", false);
//           settingservices.sharedPref.setString('photo', response['photo']);
//           print("object");

//           print(settingservices.sharedPref.getBool("$isimagechosen"));
//           update();
//         }
//       } else {
//         statueRequest = StatueRequest.ServerFaliure;
//       }

//       update();
//     }

//     isimagechosen = false;
//     update();
//   }

//   SetImage() {}
//   @override
//   Future<void> PickFromCamera() async {
//     var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
//     if (pickedimage != null) {
//       image = File(pickedimage.path);
//       int imagebeforecompression = await image!.length();

//       print("size : $imagebeforecompression");
//       settingservices.sharedPref.setBool("$isimagechosen", true);
//       isimagechosen = true;
//       update();
//     } else {}
//   }

//   Future<void> PickFromGallery() async {
//     var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);
//     if (pickedimage != null) {
//       image = File(pickedimage.path);
//       // CompressFile();

//       settingservices.sharedPref.setBool("$isimagechosen", true);
//       isimagechosen = true;
//       update();
//     } else {
//       // Handle the case where pickedimage is null
//     }
//   }

//   @override
//   void onInit() {
//     settingservices.sharedPref.setBool("$isimagechosen", false);
//     username = TextEditingController();
//     phone = TextEditingController();

//     super.onInit();
//   }
// }
