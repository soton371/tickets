import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/ticket_list_response_model.dart';
import '../../domain/usecases/ticket_use_case.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final TicketListUseCase ticketListUseCase;
  TicketsBloc(this.ticketListUseCase) : super(TicketsInitial()) {
    on<DoFetchTicketList>((event, emit) async{
      emit(TicketListLoading());
      final result = await ticketListUseCase();
      result.fold((failure) => emit(TicketListFailure(failure.message)),
              (tickets) => emit(TicketListSuccess(tickets)));
    });
  }
}
