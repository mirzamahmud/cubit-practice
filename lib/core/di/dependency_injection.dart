import 'package:api_service_interceptor/api_service_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt dependencyInject = GetIt.instance;

Future<void> configureDependency() async{

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  dependencyInject.registerLazySingleton(() => sharedPreferences);
  dependencyInject.registerLazySingleton(() => ApiServiceInterceptor(sharedPreferences: sharedPreferences));
}