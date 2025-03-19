import 'package:tickets/core/constants/constants.dart';

import '../../../../core/static_data/simulate_api_client.dart';
import '../models/ticket_list_response_model.dart';

class TicketLocalDataSources {
  static Future<List<TicketListResponseModel>> fetchTicketList() async {
    final response = await SimulateApiClient.get(StaticDataPaths.tickets);
    return ticketListResponseModelFromJson(response);
  }
}
