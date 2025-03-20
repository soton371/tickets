import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/filter_entities.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState(statusList: [], priorityList: [], selectedPriority: null, tagList: [], allTagList: [])) {
    on<DoStatusChange>((event, emit) {
      emit(state.copyWith(statusList: event.statusList));
    });

    on<DoPriorityListChange>((event, emit) {
      emit(state.copyWith(priorityList: event.priorityList));
    });

    on<DoSelectedPriorityChanged>((event, emit) {
      emit(state.copyWith(selectedPriority: event.selectedPriority));
    });

    on<DoSelectedTagListChange>((event, emit) {
      emit(state.copyWith(tagList: event.tagList));
    });

    on<DoAllTagListChange>((event, emit) {
      emit(state.copyWith(allTagList: event.allTagList));
    });
  }
}
