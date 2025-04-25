import "package:get_it/get_it.dart";
import "package:shop_stor/core/networking/dio_helper.dart";
import "package:shop_stor/core/utils/storage_helper.dart";
import "package:shop_stor/features/auth/cubit/auth_cubit.dart";
import "package:shop_stor/features/auth/repo/auth_repo.dart";
import "package:shop_stor/features/home_screen/cubit/categories_cubit.dart";
import "package:shop_stor/features/home_screen/cubit/proudect_cubit.dart";
import "package:shop_stor/features/home_screen/repo/home_repo.dart";

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();
  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);
  // Storage Helper
  sl.registerLazySingleton(() => StorageHelper());
  // Repos
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => HomeRepo(sl<DioHelper>()));
  // Cubit
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
  sl.registerFactory(() => ProudectCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));
}
