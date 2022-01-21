import 'package:code_challenge/core/services/network_service.dart';
import 'package:code_challenge/features/TimeMachine/data/repository/time_machine_repo.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/time_machine_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'core/constants/constants.dart';
import 'core/routes/navigation.dart';
import 'core/services/snackbar_service.dart';
import 'features/TimeMachine/domain/repository/time_machine_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NavigationHandler>(() => NavigationHandlerImpl());

  // Feature: TimeMachine
  // ProviderNetworkService
  sl.registerFactory(() => TimeMachineProvider(timeMachineRepo: sl(), snackBarService: sl()));
  // Repository
  sl.registerLazySingleton<TimeMachineRepo>(
      () => TimeMachineRepoImpl(networkService: sl()));

  // Externals
  sl.registerLazySingleton<GraphQLClient>(
    () => GraphQLClient(
      link: HttpLink(kBaseUrl),
      cache: GraphQLCache(),
    ),
  );

  // Services
  sl.registerLazySingleton<SnackBarService>(() => SnackBarService());
  sl.registerLazySingleton<NetworkService>(() => NetworkService(client: sl()));
}
