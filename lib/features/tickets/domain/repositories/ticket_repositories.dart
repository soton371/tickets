import '../../../../core/errors/failures.dart';
import '../../data/models/ticket_list_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class TicketListRepository {
  Future<Either<Failure, List<TicketListResponseModel>>> fetchTicketListResponse();
}