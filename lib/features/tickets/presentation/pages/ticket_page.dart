import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/features/filter/domain/entities/filter_entities.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../features_di.dart';
import '../../../filter/presentation/bloc/filter_bloc.dart';
import '../widgets/ticket_list_view.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<TicketsBloc>().add(DoFetchTicketList());
    return Scaffold(
      appBar: AppAppBar(isNotification: true),
      body: BlocBuilder<TicketsBloc, TicketsState>(
        builder: (context, state) {
          if(state is TicketListLoading) return AppLoadingState();
          if(state is TicketListFailure) return AppEmpty(msg: state.message, icon: CupertinoIcons.tickets,);
          if(state is TicketListSuccess) {
            List<StatusEntities> statusList = [];
            Set<String> uniqueStatuses = {};
            List<String> priorityList = [];
            Set<String> uniquePriorities = {};

            for (var ticket in state.ticketList) {
              if (ticket.status != null && uniqueStatuses.add(ticket.status!)) {
                statusList.add(StatusEntities(status: ticket.status!, selected: false));
              }

              if(ticket.priority != null && uniquePriorities.add(ticket.priority!)){
                priorityList.add(ticket.priority!);
              }
            }

            context.read<FilterBloc>().add(DoStatusChange(statusList));
            context.read<FilterBloc>().add(DoPriorityListChange(priorityList));

            return TicketListView(ticketList: state.ticketList,);
          }
          if(state is FilteredTicketListSuccess) {
            return TicketListView(ticketList: state.filteredTicketList,);
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
