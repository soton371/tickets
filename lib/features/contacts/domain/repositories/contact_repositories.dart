
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/contact_list_response_model.dart';

abstract class ContactListRepository {
  Future<Either<Failure, List<ContactListResponseModel>>> fetchContactListResponse();
}