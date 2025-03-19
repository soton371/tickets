import '../../../../core/constants/constants.dart';
import '../../../../core/static_data/simulate_api_client.dart';
import '../models/contact_list_response_model.dart';

class ContactLocalDataSources {
  static Future<List<ContactListResponseModel>> fetchContactList() async {
    final response = await SimulateApiClient.get(StaticDataPaths.contacts);
    return contactListResponseModelFromJson(response);
  }
}
