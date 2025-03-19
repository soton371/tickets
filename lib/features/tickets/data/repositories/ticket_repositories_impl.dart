import 'package:dartz/dartz.dart';

import 'package:tickets/core/errors/failures.dart';

import 'package:tickets/features/tickets/data/models/ticket_list_response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/ticket_repositories.dart';
import '../datasources/ticket_local_data_sources.dart';

class TicketListRepositoryImpl implements TicketListRepository {
  @override
  Future<Either<Failure, List<TicketListResponseModel>>> fetchTicketListResponse() async{
    try {
      final result = await TicketLocalDataSources.fetchTicketList();
      return Right(result);
    } catch (e, stackTrace) {
      return Left(handleException(e, stackTrace));
    }
  }
}