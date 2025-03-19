part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class DoFetchContactList extends ContactEvent{}
