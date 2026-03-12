import 'package:get_it/get_it.dart';
import '../routes/app_router.dart';
import '../utils/local_storage_service.dart';
import '../utils/talker_service.dart';
import '../constants/app_config.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/network_info_impl.dart';
import '../services/localization_service.dart';

// Auth feature imports
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/sign_in.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies({String? environment}) async {
  // Initialize Talker Service first for logging
  final talkerService = TalkerService();
  talkerService.initialize();
  locator.registerLazySingleton<TalkerService>(() => talkerService);

  talkerService.info(
    '🚀 Initializing dependencies',
    data: {'environment': environment ?? 'prod'},
  );

  // Register AppConfig first with environment
  locator.registerLazySingleton<AppConfig>(
    () => AppConfig.fromString(environment ?? 'prod'),
  );

  // Core services - Initialize LocalStorageService
  final localStorageService = LocalStorageService();
  await localStorageService.init(); // Initialize SharedPreferences
  locator.registerLazySingleton<LocalStorageService>(() => localStorageService);

  // Localization Service
  locator.registerLazySingleton<LocalizationService>(
    () => LocalizationService(locator<LocalStorageService>()),
  );

  locator.registerLazySingleton<AppRouter>(() => AppRouter());

  // Network info - connectivity checker
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Dio Client - uses GetIt internally to get dependencies
  locator.registerLazySingleton<DioClient>(() => DioClient());

  // Data Sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dioClient: locator<DioClient>(),
      localStorage: locator<LocalStorageService>(),
    ),
  );

  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(localStorage: locator<LocalStorageService>()),
  );

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator<AuthRemoteDataSource>(),
      localDataSource: locator<AuthLocalDataSource>(),
      networkInfo: locator<NetworkInfo>(),
    ),
  );

  // Use Cases
  locator.registerLazySingleton<SignIn>(
    () => SignIn(locator<AuthRepository>()),
  );

  // Blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInUseCase: locator<SignIn>(),
      authRepository: locator<AuthRepository>(),
    ),
  );
}
