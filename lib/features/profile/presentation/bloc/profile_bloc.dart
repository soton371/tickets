import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/profile_response_model.dart';
import '../../domain/usecases/profile_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileBloc(this.profileUseCase) : super(ProfileInitial()) {
    on<DoFetchProfile>((event, emit) async {
      emit(ProfileLoading());
      print("DoFetchProfile call");
      final result = await profileUseCase();
      result.fold(
        (failure) => emit(ProfileFailure(failure.message)),
        (profileResponse) => emit(ProfileSuccess(profileResponse)),
      );
    });
  }
}
