part of 'tickets_bloc.dart';

@immutable
sealed class TicketsState {}

final class TicketsInitial extends TicketsState {}

final class TicketListLoading extends TicketsState {}

final class TicketListSuccess extends TicketsState {
  final List<TicketListResponseModel> ticketList;

  TicketListSuccess(this.ticketList);
}

final class TicketListFailure extends TicketsState {
  final String message;

  TicketListFailure(this.message);
}
