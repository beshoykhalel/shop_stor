import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/core/utils/service_locator.dart';
import 'package:shop_stor/features/address_screen/address_screen.dart';
import 'package:shop_stor/features/auth/cubit/auth_cubit.dart';
import 'package:shop_stor/features/auth/login_screen.dart';
import 'package:shop_stor/features/auth/register_screen.dart';
import 'package:shop_stor/features/cart_screen/cubit/cart_cubit.dart';
import 'package:shop_stor/features/home_screen/home_screen.dart';
import 'package:shop_stor/features/home_screen/models/proudects_model.dart';
import 'package:shop_stor/features/main_screen/main_screen.dart';
import 'package:shop_stor/features/prodect_screen/prodect_screen.dart';
import 'package:shop_stor/features/splash_screen/splash_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.regesterScreen,
        name: AppRoutes.regesterScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.mianScreen,
        name: AppRoutes.mianScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<CartCubit>(),
          child: const MainScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.prodectScreen,
        name: AppRoutes.prodectScreen,
        builder: (context, state) {
          ProductsModel product = state.extra as ProductsModel;
          return BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: ProductScreen(
              proudect: product,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.addressScreen,
        name: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),
        // pageBuilder: GoTransitions.slide.toRight.withFade
      ),
      // GoRoute(
      //   path: AppRoutes.cartScreen,
      //   name: AppRoutes.cartScreen,
      //   builder: (context, state) => const CartScreen(),
      // ),
    ],
  );
}
