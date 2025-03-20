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

            for (var ticket in state.ticketList) {
              if (ticket.status != null && uniqueStatuses.add(ticket.status!)) {
                statusList.add(StatusEntities(status: ticket.status!, selected: false));
              }
            }
            context.read<FilterBloc>().add(DoStatusChange(statusList));
            return TicketListView(ticketList: state.ticketList,);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
