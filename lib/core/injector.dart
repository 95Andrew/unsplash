import 'package:get_it/get_it.dart';
import 'package:unsplash/data/managers/dio_manager.dart';
import 'package:unsplash/data/managers/network_manager.dart';
import 'package:unsplash/data/repositories/photo_repository.dart';
import 'package:unsplash/presentation/home_screen/home_cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerSingleton(DioManager());
  sl.registerSingleton(NetworkManager(sl()));
  sl.registerSingleton(PhotoRepository(sl()));
}
