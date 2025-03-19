

import 'package:get_it/get_it.dart';

import '../../features/features_di.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  //=============================== start Registering Repository Impl ===============================
  sl.registerLazySingleton<TicketListRepositoryImpl>(
          () => TicketListRepositoryImpl());

  sl.registerLazySingleton<ContactListRepositoryImpl>(
          () => ContactListRepositoryImpl());
  //=============================== end Registering Repository Impl ===============================

  //############################### start Registering UseCase ###############################
  sl.registerLazySingleton<TicketListUseCase>(
          () => TicketListUseCase(sl<TicketListRepositoryImpl>()));

  sl.registerLazySingleton<ContactListUseCase>(
          () => ContactListUseCase(sl<ContactListRepositoryImpl>()));
  //############################### end Registering UseCase ###############################

  //******************************* Start Registering Bloc *******************************
  sl.registerFactory<TicketsBloc>(() => TicketsBloc(sl<TicketListUseCase>()));

  sl.registerFactory<ContactBloc>(() => ContactBloc(sl<ContactListUseCase>()));
  //******************************* End Registering Bloc *******************************
}