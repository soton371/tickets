import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tickets/features/filter/domain/entities/filter_entities.dart';

import '../../data/models/ticket_list_response_model.dart';
import '../../domain/usecases/ticket_use_case.dart';

part 'tickets_event.dart';

part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final TicketListUseCase ticketListUseCase;
  List<TicketListResponseModel> ticketListCopy = [];

  TicketsBloc(this.ticketListUseCase) : super(TicketsInitial()) {
    on<DoFetchTicketList>(_fetchTicketList);
    on<DoFilterTicketList>(_filterTicketList);
  }

  Future<void> _fetchTicketList(
    DoFetchTicketList event,
    Emitter<TicketsState> emit,
  ) async {
    if (ticketListCopy.isEmpty) {
      emit(TicketListLoading());
    }
    ticketListCopy = [];
    final result = await ticketListUseCase();
    result.fold((failure) => emit(TicketListFailure(failure.message)), (
      tickets,
    ) {
      emit(TicketListSuccess(tickets));
      ticketListCopy = tickets;
    });
  }

  //for filter
  Future<void> _filterTicketList(
    DoFilterTicketList event,
    Emitter<TicketsState> emit,
  ) async {
    final selectedStatuses =
        event.statusList
            .where((ticket) => ticket.selected)
            .map((ticket) => ticket.status)
            .toSet();
    List<TicketListResponseModel> filteredList = List.from(ticketListCopy);

    if (selectedStatuses.isNotEmpty) {
      filteredList =
          ticketListCopy
              .where((ticket) => selectedStatuses.contains(ticket.status))
              .toList();
    }

    if (event.selectedPriority != null) {
      filteredList =
          ticketListCopy
              .where((ticket) => ticket.priority == event.selectedPriority)
              .toList();
    }

    emit(FilteredTicketListSuccess(filteredList));
  }
}
