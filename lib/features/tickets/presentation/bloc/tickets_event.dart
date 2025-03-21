part of 'tickets_bloc.dart';

@immutable
sealed class TicketsEvent {}

class DoFetchTicketList extends TicketsEvent{}

class DoFilterTicketList extends TicketsEvent{
  final List<StatusEntities> statusList;
  final String? selectedPriority;
  final List<TagEntities> tagList;
  DoFilterTicketList({required this.statusList, required this.selectedPriority, required this.tagList});
}

