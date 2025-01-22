

import 'package:e_com_ui/7%20constants/base_url.dart';

class UrlConstant {
  static const String uatUrl = "http://localhost:8080";

  // static const String uatUrl = "api-uat.softsages.com";
  static const String prodUrl = "";
  static String baseUrl = BaseUrl().isProd ? prodUrl : uatUrl;


//main routes
  static String offer = "/offer";
static String profile = "/profile";


//authentication 
  static String register = "/register";
  static String login = "/login";
  static String verifytoken = "/verify-token";


  //Profile


  //dashboard
  static String getoffer = "/getUploadsOffer";


  //Profile
  static String updateprofile = "/update-profile";
  static String viewprofile = "/view-profile";

}
