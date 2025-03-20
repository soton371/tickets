

import 'package:get_it/get_it.dart';

import '../../features/features_di.dart';
import '../../features/filter/presentation/bloc/filter_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  //=============================== start Registering Repository Impl ===============================
  sl.registerLazySingleton<TicketListRepositoryImpl>(
          () => TicketListRepositoryImpl());

  sl.registerLazySingleton<ContactListRepositoryImpl>(
          () => ContactListRepositoryImpl());

  sl.registerLazySingleton<ProfileRepositoryImpl>(
          () => ProfileRepositoryImpl());
  //=============================== end Registering Repository Impl ===============================

  //############################### start Registering UseCase ###############################
  sl.registerLazySingleton<TicketListUseCase>(
          () => TicketListUseCase(sl<TicketListRepositoryImpl>()));

  sl.registerLazySingleton<ContactListUseCase>(
          () => ContactListUseCase(sl<ContactListRepositoryImpl>()));

  sl.registerLazySingleton<ProfileUseCase>(
          () => ProfileUseCase(sl<ProfileRepositoryImpl>()));
  //############################### end Registering UseCase ###############################

  //******************************* Start Registering Bloc *******************************
  sl.registerFactory<TicketsBloc>(() => TicketsBloc(sl<TicketListUseCase>()));

  sl.registerFactory<ContactBloc>(() => ContactBloc(sl<ContactListUseCase>()));

  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl<ProfileUseCase>()));

  sl.registerFactory<FilterBloc>(() => FilterBloc());
  //******************************* End Registering Bloc *******************************
}