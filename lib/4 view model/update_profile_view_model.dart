import 'dart:convert';

import 'package:e_com_ui/1%20model/profile/update_profile_model.dart';
import 'package:e_com_ui/3%20repository/update_profile_repository.dart';
import 'package:e_com_ui/8%20global%20utils/global_utils.dart';
import 'package:e_com_ui/8%20global%20utils/loader.dart';
import 'package:e_com_ui/main.dart';
import 'package:flutter/foundation.dart';

class UpdateProfileViewModel  extends ChangeNotifier{

  UpdateProfileRepository updateProfileRepository = UpdateProfileRepository();

  Future registerUser(context, UpdateProfileModel updateprofile) async {
    Loading loading = Loading(context);
    try {
      loading.startLoading();

      final response = await updateProfileRepository.updateUserProfile(updateprofile);

      if (response.statusCode == 200) {
        snackBarKey.currentState?.clearSnackBars();
        print("StatusCode for Register ------------");
        print(response.statusCode);

        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('message')) {
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(
              message: jsonResponse['message'],
            ),
          );
        }
        snackBarKey.currentState?.showSnackBar(
            customSnackBar(message: 'Profile Updated Successfully'));
        loading.stopLoading();
        notifyListeners();
      } else {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey("error")) {
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(
              message: jsonResponse["error"],
            ),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception at CREATING NEW USER : $e");
      }
      snackBarKey.currentState
          ?.showSnackBar(customSnackBar(message: e.toString()));
      loading.stopLoading();
    }
  }



}