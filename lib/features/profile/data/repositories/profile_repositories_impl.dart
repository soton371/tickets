import 'package:dartz/dartz.dart';

import 'package:tickets/core/errors/failures.dart';

import 'package:tickets/features/profile/data/models/profile_response_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../datasources/profile_local_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  @override
  Future<Either<Failure, ProfileResponseModel>> fetchProfileResponse() async{
    try {
      final result = await ProfileDataSources.fetchProfile();
      return Right(result);
    } catch (e, stackTrace) {
      return Left(handleException(e, stackTrace));
    }
  }
}

