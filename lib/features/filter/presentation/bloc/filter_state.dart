part of 'filter_bloc.dart';

class FilterState {
  final List<StatusEntities> statusList;

  FilterState({required this.statusList});

  FilterState copyWith({List<StatusEntities>? statusList}){
    return FilterState(statusList: statusList ?? this.statusList);
  }
}

