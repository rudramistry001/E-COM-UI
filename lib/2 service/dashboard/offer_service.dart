// ignore_for_file: avoid_print

import 'dart:async';
import 'package:e_com_ui/1%20model/dashboard/offer_model.dart';
import 'package:e_com_ui/2%20service/base%20service/base_service.dart';
import 'package:e_com_ui/7%20constants/urls.dart';



class OfferServices extends BaseApiProvider {
  Future<dynamic> getoffer(OfferModel offermodel) async {

    try {
      final response = await getRequest(
          Uri.parse(UrlConstant.uatUrl + UrlConstant.offer + UrlConstant.getoffer), );
      // You can handle the response here according to your requirements
      return response;
    } catch (e) {
      // Handle errors such as network issues or server errors
      print('Error in fetching offer: $e');
      rethrow; // Rethrow the error to be handled at the caller level if needed
    }
  }


}
