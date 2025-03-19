part of 'contact_bloc.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class ContactListLoading extends ContactState {}

final class ContactListSuccess extends ContactState {
  final List<ContactListResponseModel> contactList;

  ContactListSuccess(this.contactList);
}

final class ContactListFailure extends ContactState {
  final String message;

  ContactListFailure(this.message);
}
