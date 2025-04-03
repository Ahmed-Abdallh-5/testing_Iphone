class APPlinks {
  static final String domain = "https://test.hgallerycandles.com/api";

  // static final String testlink = "http://10.0.2.2:80/ecommerce/test.php";

  ////////////////////////////////#authlinks//////////////////////////
  static final String googleSignUp = "${domain}/login/google";
  static final String SignUPlink = "${domain}/register";
  static final String login = "${domain}/login";
  static final String vertifycodelink = "${domain}/email/verify";
  static final String resendcode = "${domain}/email/verify/resend";
  static final String logout = "${domain}/logout";
  static final String deleteaccount = "${domain}/users";
///////////////////////////////////////////////////////////////////

/////////////////////////#forgetpasswordlinls///////////////////////
  static final String checkemail = "${domain}/email/forgot-password";
  static final String resetpasswordvertifycode = "${domain}/email/verify/otp";
  static final String resetpassword = "${domain}/email/forgot-password";
///////////////////////////////////////////////////////////////////

/////////////////////////////##Home###//////////////////////

  static final String ChooseCountry = "${domain}/cities";
  static final String Home2 = "${domain}/places";

///////////////////////////////FAVOURITE///////////////////////////////

  static final String addFavourite = "${domain}/favorites";

  static final String removwFavourite = "${domain}/favorites";

  static final String myfavourite = "${domain}/favorites";
/////////////////////////////BOOKING//////////////////////////////////////
  static final String bookitem = "${domain}/reservations";
  static final String getavilablehours = "${domain}/reservations";
  static final String mymatches = "${domain}/reservations";

///////////////////////////////Tournment/////////////////////////////////////
  static final String tournament = "${domain}/tournaments";

////////////////////////setting////////////////////////////////////////
  static final String EditProfileusername = "${domain}/users";
  static final String EditProfilephoto = "${domain}/users";
}
