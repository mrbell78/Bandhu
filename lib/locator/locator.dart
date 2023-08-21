import 'package:get_it/get_it.dart';
import '../http-service/http-service.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerLazySingleton<HttpService>(() => HttpService());
  //locator.registerLazySingleton<LoginRepository>(() => LoginRepository());
  // locator.registerLazySingleton<TruckRepository>(() => TruckRepository());
  // locator.registerLazySingleton<HomeRepository>(() => HomeRepository());
  // locator.registerLazySingleton<ProductRepository>(() => ProductRepository());
  // locator.registerLazySingleton<ProfileRepository>(() => ProfileRepository());
  // locator.registerLazySingleton<ServiceRepository>(() => ServiceRepository());


}