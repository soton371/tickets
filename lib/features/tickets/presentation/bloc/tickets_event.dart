part of 'tickets_bloc.dart';

@immutable
sealed class TicketsEvent {}

class DoFetchTicketList extends TicketsEvent{}