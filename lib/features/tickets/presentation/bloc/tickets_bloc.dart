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
    //for status
    final selectedStatuses =
        event.statusList
            .where((ticket) => ticket.selected)
            .map((ticket) => ticket.status)
            .toSet();
    List<TicketListResponseModel> filteredList = List.from(ticketListCopy);

    if (selectedStatuses.isNotEmpty) {
      filteredList =
          filteredList
              .where((ticket) => selectedStatuses.contains(ticket.status))
              .toList();
    }

    //for priority
    if (event.selectedPriority != null) {
      filteredList =
          filteredList
              .where((ticket) => ticket.priority == event.selectedPriority)
              .toList();
    }

    ///for tag
    final selectedTags = event.tagList
        .where((ticket) => ticket.selected)
        .map((ticket) => ticket.title)
        .toSet();

    if (selectedTags.isNotEmpty) {
      filteredList = filteredList.where((ticket) {
        return ticket.state?.any((state) => selectedTags.contains(state)) ?? false;
      }).toList();
    }

    emit(FilteredTicketListSuccess(filteredList));
  }
}
