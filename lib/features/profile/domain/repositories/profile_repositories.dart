import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/profile_response_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponseModel>> fetchProfileResponse();
}