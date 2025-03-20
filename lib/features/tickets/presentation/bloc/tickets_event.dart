part of 'tickets_bloc.dart';

@immutable
sealed class TicketsEvent {}

class DoFetchTicketList extends TicketsEvent{}

class DoFilterTicketList extends TicketsEvent{
  final List<StatusEntities> statusList;
  DoFilterTicketList({required this.statusList});
}