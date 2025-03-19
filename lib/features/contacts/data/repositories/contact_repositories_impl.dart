
import 'package:dartz/dartz.dart';
import 'package:tickets/core/errors/failures.dart';
import 'package:tickets/features/contacts/data/models/contact_list_response_model.dart';
import 'package:tickets/features/contacts/domain/repositories/contact_repositories.dart';

import '../../../../core/errors/exceptions.dart';
import '../datasources/contact_local_data_source.dart';

class ContactListRepositoryImpl implements ContactListRepository{
  @override
  Future<Either<Failure, List<ContactListResponseModel>>> fetchContactListResponse() async{
    try {
      final result = await ContactLocalDataSources.fetchContactList();
      return Right(result);
    } catch (e, stackTrace) {
      return Left(handleException(e, stackTrace));
    }
  }

}