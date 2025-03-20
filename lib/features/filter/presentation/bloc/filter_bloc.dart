import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/filter_entities.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState(statusList: [])) {
    on<DoStatusChange>((event, emit) {
      emit(state.copyWith(statusList: event.statusList));
    });
  }
}
