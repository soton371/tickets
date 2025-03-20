part of 'filter_bloc.dart';

class FilterState {
  final List<StatusEntities> statusList;
  final List<String?> priorityList;
  final String? selectedPriority;
  final List<TagEntities> tagList;
  final List<TagEntities> allTagList;

  FilterState({
    required this.statusList,
    required this.priorityList,
    required this.selectedPriority,
    required this.tagList,
    required this.allTagList,
  });

  FilterState copyWith({
    List<StatusEntities>? statusList,
    List<String?>? priorityList,
    List<TagEntities>? tagList,
    List<TagEntities>? allTagList,
    String? selectedPriority,
  }) {
    return FilterState(
      statusList: statusList ?? this.statusList,
      priorityList: priorityList ?? this.priorityList,
      tagList: tagList ?? this.tagList,
      allTagList: allTagList ?? this.allTagList,
      selectedPriority: selectedPriority ?? this.selectedPriority,
    );
  }
}
