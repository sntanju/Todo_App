import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/config/config_api.dart';
import 'package:todo_app/src/core/application/api_interceptor.dart';
import 'package:todo_app/src/core/application/navigation_service.dart';
import 'package:todo_app/src/core/application/token_service.dart';
import 'package:todo_app/src/core/data/repositories/cache_repository_impl.dart';
import 'package:todo_app/src/core/domain/interfaces/interface_api_interceptor.dart';
import 'package:todo_app/src/core/domain/interfaces/interface_cache_repository.dart';
import 'package:todo_app/src/features/home/presentation/providers/provider_common.dart';
import 'package:todo_app/src/features/todo/data/datasources/task_local_datasource.dart';
import 'package:todo_app/src/features/todo/data/repositories/task_repository_impl.dart';
import 'package:todo_app/src/features/todo/domain/repositories/interface_task_repository.dart';
import 'package:todo_app/src/features/todo/presentation/providers/provider_task.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //using dependency-injection
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  ///REPOSITORIES
  //#region Repositories
  sl.registerLazySingleton<ICacheRepository>(() => CacheRepositoryImpl(sharedPreference: sl()));
  sl.registerLazySingleton(() => TaskLocalDataSource());
  sl.registerLazySingleton<ITaskRepository>(
          () => TaskRepositoryImpl(localDataSource: sl<TaskLocalDataSource>()));
  //#endregion


  ///USE-CASES


  ///END of USE-CASES

  ///PROVIDERS
  //region Providers
  sl.registerFactory(() => ProviderCommon(),);
  sl.registerFactory(() => ProviderTask(sl<ITaskRepository>()));


  //interceptors
  sl.registerLazySingleton<IApiInterceptor>(() => ApiInterceptor(baseUrl: ConfigApi.baseUrl));   ///CHANGE SERVER HERE

  /// Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  ///services
  sl.registerSingleton(NavigationService());  //to initialize navigator-key for app-runtime
  sl.registerSingleton(TokenService()); //token service to store token app-runtime
  //logger
  sl.registerLazySingleton(()=>Logger(
    printer: PrettyPrinter(
      colors: false,
    ),
  ),);

}