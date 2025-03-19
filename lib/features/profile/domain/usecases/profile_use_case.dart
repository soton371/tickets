

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/profile_response_model.dart';
import '../repositories/profile_repositories.dart';

class ProfileUseCase {
  final ProfileRepository repository;

  ProfileUseCase(this.repository);

  Future<Either<Failure, ProfileResponseModel>> call(){
    return repository.fetchProfileResponse();
  }
}

