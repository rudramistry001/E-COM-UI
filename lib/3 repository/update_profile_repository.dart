import 'package:e_com_ui/1%20model/profile/update_profile_model.dart';
import 'package:e_com_ui/2%20service/profile/update_profile_service.dart';

class UpdateProfileRepository {
  UpdateProfileService updateProfileService = UpdateProfileService();

  Future updateUserProfile(UpdateProfileModel updateProfile) async {
    final response = await updateProfileService.updateUserProfile(updateProfile);
    return response;
  }
}