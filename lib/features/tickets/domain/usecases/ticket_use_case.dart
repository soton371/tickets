import '../../../../core/errors/failures.dart';
import '../../data/models/ticket_list_response_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/ticket_repositories.dart';


class TicketListUseCase {
  final TicketListRepository repository;

  TicketListUseCase(this.repository);

  Future<Either<Failure, List<TicketListResponseModel>>> call() {
    return repository.fetchTicketListResponse();
  }
}