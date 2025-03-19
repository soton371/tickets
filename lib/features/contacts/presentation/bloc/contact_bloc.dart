import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/contact_list_response_model.dart';
import '../../domain/usecases/contact_use_case.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactListUseCase contactListUseCase;
  ContactBloc(this.contactListUseCase) : super(ContactInitial()) {
    List<ContactListResponseModel> contactListCopy = [];
    on<DoFetchContactList>((event, emit) async{
      if(contactListCopy.isEmpty){
        emit(ContactListLoading());
      }

      final result = await contactListUseCase();
      result.fold(
            (failure) => emit(ContactListFailure(failure.message)),
            (contacts) {
          emit(ContactListSuccess(contacts));
          contactListCopy = contacts;
        },
      );
    });
  }
}
