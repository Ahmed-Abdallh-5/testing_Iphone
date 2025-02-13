import 'package:ecommerce/core/middlware/mymiddlware.dart';
import 'package:ecommerce/view/screens/account/allfavouritescreen.dart';
import 'package:ecommerce/view/screens/account/editprofile.dart';
import 'package:ecommerce/view/screens/checkout/checkout.dart';
import 'package:ecommerce/view/screens/chooselangscreen.dart';
import 'package:ecommerce/view/screens/onboarding/onboardingscreen.dart';
import 'package:ecommerce/view/screens/settingscreens/aboutus.dart';
import 'package:ecommerce/view/screens/authscreens/forgetpasswordscreens/forgetpassword.dart';
import 'package:ecommerce/view/screens/authscreens/forgetpasswordscreens/resetpassword.dart';
import 'package:ecommerce/view/screens/authscreens/forgetpasswordscreens/successresetpassword.dart';
import 'package:ecommerce/view/screens/authscreens/forgetpasswordscreens/vertficationresetpass.dart';
import 'package:ecommerce/view/screens/authscreens/login/verficationcodelogin.dart';
import 'package:ecommerce/view/screens/details/checkoutscreen.dart';
import 'package:ecommerce/view/screens/settingscreens/privacyscreen.dart';
import 'package:ecommerce/view/screens/choosecountryscreens/choosecountryscreen.dart';
import 'package:ecommerce/view/screens/settingscreens/checkemail.dart';
import 'package:ecommerce/view/screens/settingscreens/deleteaccountpage.dart';
import 'package:ecommerce/view/screens/authscreens/login/login.dart';
import 'package:ecommerce/view/screens/authscreens/signupsceens/signup.dart';
import 'package:ecommerce/view/screens/authscreens/signupsceens/successsignnup.dart';
import 'package:ecommerce/view/screens/authscreens/signupsceens/vertfiycodesignup.dart';
import 'package:ecommerce/view/screens/homescreens/homescreen.dart';

import 'package:ecommerce/view/screens/details/productdetail.dart';

import 'package:ecommerce/view/screens/settingscreens/settingscreen.dart';
import 'package:ecommerce/view/screens/settingscreens/successrestetpass.dart';
import 'package:ecommerce/view/screens/settingscreens/vertficationsettingpage.dart';
import 'package:ecommerce/view/screens/settingscreens/termsandconditions.dart';
import 'package:ecommerce/view/screens/spalshscreen/splashscreen.dart';
import 'package:ecommerce/view/screens/tournment/tournamentdetailsscreen.dart';
import 'package:ecommerce/view/screens/viewallscreens/viewallitemscreen.dart';
import 'package:ecommerce/view/screens/viewallscreens/viewalloffers.dart';
import 'package:ecommerce/view/screens/tournment/tournmentscreen.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(name: "/", page: () => SplashScreen(), middlewares: [Mymiddlware()]),
  GetPage(name: "/chooselangscreen", page: () => chooselangscreen()),
  GetPage(name: "/onbordscreen", page: () => OnboardingScreen()),
  GetPage(name: "/loginsceen", page: () => Loginscreen()),
  GetPage(name: "/signup", page: () => SignUpscreen()),
  GetPage(name: "/forgetpassword", page: () => ForgetpasswordScreen()),
  GetPage(name: "/resetpassword", page: () => ResetpasswordScreen()),
  GetPage(name: "/vertficode", page: () => Vertficationscreen()),
  GetPage(name: "/SuccesResetPassWord", page: () => SuccesResetPassWord()),
  GetPage(
      name: "/VertficationscreenSignUp",
      page: () => VertficationscreenSignUp()),
  GetPage(name: "/SuccesSignUP", page: () => SuccesSignUP()),
  // GetPage(name: "/home", page: () => Home()),
  GetPage(name: "/homeScreen", page: () => Homescreen()),
  GetPage(name: "/productsdetails", page: () => ProductDetails()),
  // GetPage(name: "/choosecountryscreen", page: () => ChooseCounteyScreen()),
  // GetPage(name: "/myfavourrite", page: () => FavouriteScreen()),
  GetPage(name: "/settingscreen", page: () => SettingScreeneScreen()),
  // GetPage(name: "/editprofilescreen", page: () => EditProfile()),
  // GetPage(name: "/changeCounteyscreen", page: () => ChangeCounteyscreen()),
  // GetPage(name: "/avilableHoursScreen", page: () => AvilableHoursScreen()),
  GetPage(name: "/viewallItems", page: () => ViewallItems()),
  GetPage(name: "/viewallOffersScreen", page: () => ViewallOffersScreen()),
  GetPage(name: "/deleteAccountScreen", page: () => DeleteAccountScreen()),
  GetPage(
      name: "/vertficationscreenLogin", page: () => VertficationscreenLogin()),
  GetPage(
      name: "/vertficodeSettingPage",
      page: () => VertficationscreenSettingPage()),
  GetPage(
      name: "/succesResetPassWordSettingPage",
      page: () => SuccesResetPassWordSettingPage()),
  GetPage(name: "/checkMailScreen", page: () => CheckMailScreen()),
  // GetPage(
  //     name: "/resetpasswordSettingScreen",
  //     page: () => ResetpasswordSettingScreen()),
  GetPage(name: "/aboutUsScreen", page: () => AboutUsScreen()),
  GetPage(name: "/privacyScreen", page: () => PrivacyScreen()),
  GetPage(name: "/checkoutScreen", page: () => CheckoutScreen()),
  GetPage(
      name: "/termsAndConditionsScreen",
      page: () => TermsAndConditionsScreen()),
  // GetPage(name: "/changeLangScreen", page: () => ChangeLangScreen()),
  GetPage(name: "/checkoutscreen", page: () => CheckOutScreen()),
  // GetPage(name: "/ReviewPage", page: () => ReviewPage()),
  GetPage(
      name: "/vertficationscreenLogin", page: () => VertficationscreenLogin()),
  GetPage(name: "/tournmentScreen", page: () => TournmentScreen()),

  GetPage(name: "/allFavouriteScreen", page: () => AllFavouriteScreen()),
  GetPage(
      name: "/tornamentDetailsScreen", page: () => TornamentDetailsScreen()),

  GetPage(
      name: "/vertficationscreenLogin", page: () => VertficationscreenLogin()),
  GetPage(name: "/editProfleScreen", page: () => EditProfleScreen()),
  // GetPage(name: "/myAccountScreen", page: () => MyAccountScreen()),
  // GetPage(
  //     name: "/resetpasswordSettingpage",
  //     page: () => SettingResetpasswordScreen()),
];
