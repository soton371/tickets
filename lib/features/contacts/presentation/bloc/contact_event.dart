part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class DoFetchContactList extends ContactEvent{}


class DoSearchContact extends ContactEvent {
  final String query;
  DoSearchContact(this.query);
}
