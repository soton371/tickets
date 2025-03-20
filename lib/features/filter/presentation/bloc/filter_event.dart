part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class DoStatusChange extends FilterEvent{
  final List<StatusEntities> statusList;
  DoStatusChange(this.statusList);
}
