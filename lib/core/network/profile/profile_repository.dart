import 'package:codeblurb_mobile/core/network/models/profile_response.dart';
import 'package:codeblurb_mobile/core/network/profile/profile_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepoProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(ref.watch(profileApiProvider)),
  name: 'Profile Repository Provider',
);

class ProfileRepository {
  ProfileRepository(this._profileApi);
  final ProfileApi _profileApi;

  Future<ProfileResponse> getProfile() async {
    final response = await _profileApi.getProfile();
    return ProfileResponse.fromJson(response.data!);
  }
}
