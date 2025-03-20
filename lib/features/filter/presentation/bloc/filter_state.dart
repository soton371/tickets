part of 'filter_bloc.dart';

class FilterState {
  final List<StatusEntities> statusList;
  final List<String> priorityList;
  final String? selectedPriority;

  FilterState({
    required this.statusList,
    required this.priorityList,
    required this.selectedPriority,
  });

  FilterState copyWith({
    List<StatusEntities>? statusList,
    List<String>? priorityList,
    String? selectedPriority,
  }) {
    return FilterState(
      statusList: statusList ?? this.statusList,
      priorityList: priorityList ?? this.priorityList,
      selectedPriority: selectedPriority,
    );
  }
}
