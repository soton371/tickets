import '../../../../core/constants/constants.dart';
import '../../../../core/static_data/simulate_api_client.dart';
import '../models/profile_response_model.dart';

class ProfileDataSources {
  static Future<ProfileResponseModel> fetchProfile() async {
    final response = await SimulateApiClient.get(StaticDataPaths.profile);
    return profileResponseModelFromJson(response);
  }
}