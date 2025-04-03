import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/setting/editprofile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

abstract class MyaccountCon extends GetxController {
  gotosettingpage();
  uploadimage();
  PickFromCamera();
  PickFromGallery();
  // Getdata();
  gotoproductdetails(items);
  gotofavouritescreen();
  gotoTornamentScreen();

  Gotoedtoscreen();
}

class MyaccountConimble extends MyaccountCon {
  bool isanychanged = false;
  String? phoneint;
  String? usernamint;
  var ImageOnServer;
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  File? image;
  late TextEditingController username;
  ImagePicker imagepicker = ImagePicker();
  StatueRequest? statueRequest;
  late TextEditingController phone;
  EditProfile editProfile = EditProfile(Get.find());
  Settingservices settingservices = Get.find();
  String? UploadedImage;
  bool isimagechosen = false;

  List MyFavouriteList = [];

  Gotoedtoscreen() {
    Get.toNamed("/editProfleScreen");
  }

  // gotoeditprofile() {
  //   Get
  // }
  gotofavouritescreen() {
    MyFavouriteList.clear();
    Getdata();
    Get.toNamed("/allFavouriteScreen");
  }

  gotoTornamentScreen() {
    Get.toNamed("/tournmentScreenSeprated");
  }

  @override
  ChangeUsername(String usernamee) async {
    if (formstatekey.currentState!.validate()) {
      statueRequest = StatueRequest.loading;
      update();
      var response = await editProfile.changeuserinfo(name: usernamee);

      statueRequest = handlingdata(response);
      if (StatueRequest.Success == statueRequest) {
        print(response);
        if (response['message'] == 'User updated successfully.') {
          settingservices.sharedPref.setString('username', username.text);
        }
      }
      update();
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "308".tr,
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "307".tr,
      );
    }
  }

  int getlength() {
    update();
    return MyFavouriteList.length;
  }

  Getdata() async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await editProfile.getmyfavourite();
    statueRequest = handlingdata(response);
    update();
    if (statueRequest == StatueRequest.Success) {
      MyFavouriteList.clear();
      MyFavouriteList.addAll(
          response['data'].where((e) => e['isFavorite'] == true));
      print("ramdan");
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "308".tr,
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "307".tr,
      );
    }
    update();
  }

  deletefromfavouritelist(int id) {
    print("objeckgjhgu");
    print(MyFavouriteList);
    MyFavouriteList.removeWhere((element) => element['id'] == id);
    update();
  }

  gotoproductdetails(items) {
    Homeimp2 homeimp2 = Get.put(Homeimp2());
    Get.toNamed("/productsdetails",
        arguments: {"itemmodel": items, 'map': homeimp2.favoriteMap});
  }

  Future<File> CompressFile(File imagefile) async {
    img.Image? image = img.decodeImage(imagefile.readAsBytesSync());
    img.Image resizedimage =
        img.copyResize(image!, width: image.width, height: image.height);
    List<int> compreesedbytes = img.encodeJpg(resizedimage, quality: 5);
    String extenstion = imagefile.path.split('.').last;
    File CompressedFile = File(imagefile.path.replaceAll(
      RegExp(r'\.[^\.]+$'),
      '_compressed.$extenstion',
    ));
    CompressedFile.writeAsBytesSync(compreesedbytes);
    int sizeaftercmpression = CompressedFile.lengthSync().toInt();
    print("size : $sizeaftercmpression");

    return CompressedFile;
  }

  Setimage(response) {
    ImageOnServer = response;
    print(ImageOnServer);
  }

  Future uploadimage() async {
    if (image == null) {
      // print("object");
      return;
    } else {
      statueRequest = StatueRequest.loading;

      update();
      File compressedFile = await CompressFile(image!);
      print(
          'Compressed file size: ${compressedFile.lengthSync().toInt()} bytes');

      // print(compressedFile.path);
      var response = await editProfile.uploaduserimage2(compressedFile);

      statueRequest = handlingdata(response);

      if (StatueRequest.Success == statueRequest) {
        if (response['message'] == "User updated successfully.") {
          print("objectSXxxwerewr34234");
          settingservices.sharedPref
              .setString("photo", response['data']['photo']);
          print(response['data']['photo']);
          update();
        }
      } else if (statueRequest == StatueRequest.offline) {
        Get.defaultDialog(
          title: "311".tr,
          middleText: "308".tr,
        );
      } else if (statueRequest == StatueRequest.ServerFaliure) {
        Get.defaultDialog(
          title: "311".tr,
          middleText: "307".tr,
        );
      }

      update();
    }

    isimagechosen = false;
    update();
  }

  changevalue() {
    isanychanged = true;
    update();
  }

  @override
  Future<void> PickFromCamera() async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      status = await Permission.camera.request();
    }

    if (status.isGranted) {
      var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
      if (pickedimage != null) {
        image = File(pickedimage.path);
        int imagebeforecompression = await image!.length();
        print(image);
        print("size : $imagebeforecompression");

        settingservices.sharedPref.setBool("isimagechosen", true);
        isimagechosen = true;
        update();
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      print("Camera permission denied");
    }
  }

  Future<void> PickFromGallery() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      if (await Permission.photos.isDenied ||
          await Permission.photos.isRestricted) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.photos.status;
      }
    } else {
      status = await Permission.photos.request();
    }

    if (status.isGranted) {
      var pickedimage =
          await imagepicker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        image = File(pickedimage.path);
        print(image);

        settingservices.sharedPref.setBool("isimagechosen", true);
        isimagechosen = true;
        update();
      }
    } else if (status.isPermanentlyDenied) {
      print("Gallery permission permanently denied. Open settings.");
      openAppSettings();
    } else {
      print("Gallery permission denied");
    }
  }

  @override
  void onInit() {
    usernamint = settingservices.sharedPref.getString("username");
    phoneint = settingservices.sharedPref.getString("phone");
    username = TextEditingController();
    phone = TextEditingController();
    Getdata();
    print("object");
    super.onInit();
  }

  gotosettingpage() {
    Get.toNamed("/settingscreen");
  }
}
