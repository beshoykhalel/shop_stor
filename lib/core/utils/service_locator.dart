import "package:get_it/get_it.dart";
import "package:shop_stor/core/networking/dio_helper.dart";
import "package:shop_stor/features/auth/cubit/auth_cubit.dart";
import "package:shop_stor/features/auth/repo/auth_repo.dart";

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();
  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);
  // Repos
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  // Cubit
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
}
