import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/contact_list_response_model.dart';
import '../repositories/contact_repositories.dart';

class ContactListUseCase {
  final ContactListRepository repository;

  ContactListUseCase(this.repository);

  Future<Either<Failure, List<ContactListResponseModel>>> call(){
    return repository.fetchContactListResponse();
  }
}