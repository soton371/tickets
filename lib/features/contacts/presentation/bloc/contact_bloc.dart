import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/contact_list_response_model.dart';
import '../../domain/usecases/contact_use_case.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactListUseCase contactListUseCase;
  List<ContactListResponseModel> contactListCopy = [];

  ContactBloc(this.contactListUseCase) : super(ContactInitial()) {
    on<DoFetchContactList>(_fetchContacts);

    //for search contacts
    on<DoSearchContact>(_searchContacts);
  }

  Future<void> _fetchContacts(
    DoFetchContactList event,
    Emitter<ContactState> emit,
  ) async {
    if (contactListCopy.isEmpty) {
      emit(ContactListLoading());
    }

    final result = await contactListUseCase();
    result.fold((failure) => emit(ContactListFailure(failure.message)), (
      contacts,
    ) {
      contactListCopy = contacts;
      emit(ContactListSuccess(contacts));
    });
  }

  void _searchContacts(DoSearchContact event, Emitter<ContactState> emit) {
    if (state is ContactListSuccess) {
      final filteredList =
          contactListCopy
              .where(
                (contact) =>
                    contact.name!.toLowerCase().contains(
                      event.query.toLowerCase(),
                    ) ||
                    contact.email!.toLowerCase().contains(
                      event.query.toLowerCase(),
                    ),
              )
              .toList();
      emit(ContactListSuccess(filteredList));
    }
  }
}
