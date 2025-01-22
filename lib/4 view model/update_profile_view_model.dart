import 'dart:convert';
import 'package:e_com_ui/1%20model/profile/update_profile_model.dart';
import 'package:e_com_ui/3%20repository/update_profile_repository.dart';
import 'package:e_com_ui/8%20global%20utils/global_utils.dart';
import 'package:e_com_ui/8%20global%20utils/loader.dart';
import 'package:e_com_ui/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  final UpdateProfileRepository updateProfileRepository =
      UpdateProfileRepository();

  Future registerUser(context, UpdateProfileModel updateProfile) async {
    Loading loading = Loading(context);
    try {
      loading.startLoading();

      final response =
          await updateProfileRepository.updateUserProfile(updateProfile);

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

  String? email;
  String? fullname;
  bool isLoading = false;

  Future<void> viewUserProfile(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await updateProfileRepository.viewUserProfile();
      
      print("API Response Status Code: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        
        // Access the nested 'user' object correctly
        if (jsonResponse['success'] == true && jsonResponse['user'] != null) {
          final userData = jsonResponse['user'];
          
          // Update the values from the user object
          email = userData['email'];
          fullname = userData['fullName'];
          
          print("Updated Email: $email");
          print("Updated FullName: $fullname");
        }
        
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        final jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey("error")) {
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(
              message: jsonResponse["error"],
            ),
          );
        }
        notifyListeners();
      }
    } catch (e) {
      print("Exception at VIEWING USER PROFILE : $e");
      isLoading = false;
      snackBarKey.currentState?.showSnackBar(
        customSnackBar(message: e.toString())
      );
      notifyListeners();
    }
  }
}
