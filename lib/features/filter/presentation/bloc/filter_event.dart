part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class DoStatusChange extends FilterEvent{
  final List<StatusEntities> statusList;
  DoStatusChange(this.statusList);
}


class DoPriorityListChange extends FilterEvent{
  final List<String> priorityList;
  DoPriorityListChange(this.priorityList);
}


class DoSelectedPriorityChanged extends FilterEvent{
  final String? selectedPriority;
  DoSelectedPriorityChanged(this.selectedPriority);
}



class DoSelectedTagListChange extends FilterEvent{
  final List<TagEntities> tagList;
  DoSelectedTagListChange(this.tagList);
}
