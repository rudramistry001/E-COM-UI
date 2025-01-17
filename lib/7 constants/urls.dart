

import 'package:e_com_ui/7%20constants/base_url.dart';

class UrlConstant {
  static const String uatUrl = "http://localhost:8080";

  // static const String uatUrl = "api-uat.softsages.com";
  static const String prodUrl = "";
  static String baseUrl = BaseUrl().isProd ? prodUrl : uatUrl;

  static String register = "/register";

  static String login = "/login";
  static String verifytoken = "/verify-token";
}
