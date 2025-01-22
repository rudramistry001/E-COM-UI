import 'package:e_com_ui/1%20model/profile/update_profile_model.dart';
import 'package:e_com_ui/2%20service/profile/update_profile_service.dart';

class UpdateProfileRepository {
  final UpdateProfileService _updateProfileService = UpdateProfileService();

  /// Updates the user's profile
  Future<dynamic> updateUserProfile(UpdateProfileModel updateProfile) async {
    try {
      final response =
          await _updateProfileService.updateUserProfile(updateProfile);
      // Optionally process the response here, e.g., map it to a specific model
      return response;
    } catch (e) {
      // Handle and log the error
      print('Error in repository (updateUserProfile): $e');
      rethrow;
    }
  }

  /// Fetches the user's profile
  Future<dynamic> viewUserProfile() async {
    try {
      final response = await _updateProfileService.viewUserProfile();
      // Optionally process the response here, e.g., map it to a specific model
      return response;
    } catch (e) {
      // Handle and log the error
      print('Error in repository (viewUserProfile): $e');
      rethrow;
    }
  }
}
