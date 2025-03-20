part of 'filter_bloc.dart';

class FilterState {
  final List<StatusEntities> statusList;
  final List<String> priorityList;
  final String? selectedPriority;
  final List<TagEntities> tagList;

  FilterState({
    required this.statusList,
    required this.priorityList,
    required this.selectedPriority,
    required this.tagList,
  });

  FilterState copyWith({
    List<StatusEntities>? statusList,
    List<String>? priorityList,
    List<TagEntities>? tagList,
    String? selectedPriority,
  }) {
    return FilterState(
      statusList: statusList ?? this.statusList,
      priorityList: priorityList ?? this.priorityList,
      tagList: tagList ?? this.tagList,
      selectedPriority: selectedPriority,
    );
  }
}
