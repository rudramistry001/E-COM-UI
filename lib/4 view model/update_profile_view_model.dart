import 'dart:convert';
import 'package:e_com_ui/1%20model/profile/update_profile_model.dart';
import 'package:e_com_ui/3%20repository/update_profile_repository.dart';
import 'package:e_com_ui/8%20global%20utils/global_utils.dart';
import 'package:e_com_ui/8%20global%20utils/loader.dart';
import 'package:e_com_ui/main.dart';
import 'package:flutter/material.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  final UpdateProfileRepository updateProfileRepository =
      UpdateProfileRepository();

   String? email;
  String? fullname;
  bool isLoading = false;

  Future<void> updateuser(BuildContext context, UpdateProfileModel updateProfile) async {
    Loading loading = Loading(context);
    isLoading = true;


    try {
      loading.startLoading();
      
      // Log the request details
      print("UPDATE PROFILE REQUEST STARTED -------");
      print("Request Payload (before sending): ${jsonEncode(updateProfile.toJson())}");

      final response = await updateProfileRepository.updateUserProfile(updateProfile);
      
      // Log the response details
      print("API Response Status Code: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("Decoded JSON Response: $jsonResponse");

        // Update local state if the response contains user data
        if (jsonResponse['success'] == true && jsonResponse['user'] != null) {
          final userData = jsonResponse['user'];
          email = userData['email'];
          fullname = userData['fullName'];
          
          print("Updated State Values:");
          print("Email: $email");
          print("FullName: $fullname");
        }

        // Handle success messages
        if (jsonResponse.containsKey('message')) {
          print("Success Message: ${jsonResponse['message']}");
          snackBarKey.currentState?.clearSnackBars();
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(
              message: jsonResponse['message'],
            ),
          );
        } else {
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(message: 'Profile Updated Successfully')
          );
        }

        isLoading = false;
        loading.stopLoading();
        notifyListeners();
        
        print("UPDATE PROFILE REQUEST COMPLETED SUCCESSFULLY -------");
        print("API Response Body: ${response.body}");
      } else {
        // Handle error responses
        print("UPDATE PROFILE REQUEST FAILED -------");
        print("Error Status Code: ${response.statusCode}");
        
        
        final jsonResponse = json.decode(response.body);
        print("Error Response Body: $jsonResponse");

        if (jsonResponse.containsKey("error")) {
          String errorMessage = jsonResponse["error"];
          print("Error Message: $errorMessage");
          
          snackBarKey.currentState?.showSnackBar(
            customSnackBar(
              message: errorMessage,
            ),
          );
        }

        isLoading = false;
        loading.stopLoading();
        notifyListeners();
      }
    } catch (e) {
      // Handle exceptions
      print("EXCEPTION IN UPDATE PROFILE -------");
      print("Exception Details: $e");
      print("Stack Trace: ${StackTrace.current}");

      isLoading = false;
      loading.stopLoading();
      
      snackBarKey.currentState?.showSnackBar(
        customSnackBar(message: e.toString())
      );
      
      notifyListeners();
    }
  }


  Future<void> viewUserProfile(BuildContext context) async {
    isLoading = true;

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
