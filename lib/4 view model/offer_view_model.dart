import 'dart:convert';

import 'package:e_com_ui/1%20model/dashboard/offer_model.dart';
import 'package:e_com_ui/3%20repository/offer_repository.dart';
import 'package:e_com_ui/8%20global%20utils/global_utils.dart';
import 'package:e_com_ui/8%20global%20utils/loader.dart';
import 'package:e_com_ui/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OfferViewModel extends  ChangeNotifier {
  OfferRepository offerRepository = OfferRepository();

  List<String>? imageUrls;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchOffers(BuildContext context, OfferModel offerModel) async {
    Loading loading = Loading(context);
    try {
      loading.startLoading();
      _isLoading = true;
      

      final response = await offerRepository.getOffers(offerModel);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('message')) {
          snackBarKey.currentState?.clearSnackBars();
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(message: jsonResponse['message']),
          );
        }

        // Process the image URLs from the response
        if (jsonResponse.containsKey('imageUrls')) {
          imageUrls = List<String>.from(jsonResponse['imageUrls']);
        }

        snackBarKey.currentState?.showSnackBar(
          customSnackBar(message: 'Offers fetched successfully'),
        );
      } else {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey("error")) {
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(message: jsonResponse["error"]),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception while fetching offers: $e");
      }
      snackBarKey.currentState?.showSnackBar(
        customSnackBar(message: "Failed to fetch offers: ${e.toString()}"),
      );
    } finally {
      _isLoading = false;
      loading.stopLoading();
      notifyListeners();
    }
  }

  // Getter for image URLs
  List<String>? get getImageUrls => imageUrls;

  // Handle error messages
  void handleError(String message) {
    snackBarKey.currentState?.showSnackBar(
      customSnackBar(message: message),
    );
  }

}
