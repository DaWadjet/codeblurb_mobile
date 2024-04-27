import 'package:codeblurb_mobile/network/models/profile_response.dart';
import 'package:codeblurb_mobile/network/profile/profile_api.dart';

class ProfileRepository {
  ProfileRepository(this._profileApi);
  final ProfileApi _profileApi;

  Future<ProfileResponse> getProfile() async {
    final response = await _profileApi.getProfile();
    return ProfileResponse.fromJson(response.data!);
  }
}
