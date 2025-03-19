

import 'package:get_it/get_it.dart';

import '../../features/features_di.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  //=============================== start Registering Repository Impl ===============================
  sl.registerLazySingleton<TicketListRepositoryImpl>(
          () => TicketListRepositoryImpl());
  //=============================== end Registering Repository Impl ===============================

  //############################### start Registering UseCase ###############################
  sl.registerLazySingleton<TicketListUseCase>(
          () => TicketListUseCase(sl<TicketListRepositoryImpl>()));
  //############################### end Registering UseCase ###############################

  //******************************* Start Registering Bloc *******************************
  sl.registerFactory<TicketsBloc>(() => TicketsBloc(sl<TicketListUseCase>()));
  //******************************* End Registering Bloc *******************************
}