import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/core/constants/constants.dart';
import 'package:tickets/features/features_di.dart';

import '../../../../core/widgets/widgets.dart';
import '../widgets/contact_list_view.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(DoFetchContactList());
    return Scaffold(
      appBar: AppAppBar(isNotification: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: AppSizes.paddingBody,
            ),
            child: AppSearchBar(
              hintText: "Search contacts",
              controller: searchController,
              onChanged: (value) {
                context.read<ContactBloc>().add(DoSearchContact(value));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if(state is ContactListLoading) return AppLoadingState();
                if(state is ContactListSuccess) {
                  return state.contactList.isEmpty ? AppEmpty(msg: "Contact not found") : ContactListView(
                    contactList: state.contactList,
                  );
                }
                if(state is ContactListFailure) return AppEmpty(msg: state.message);
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
