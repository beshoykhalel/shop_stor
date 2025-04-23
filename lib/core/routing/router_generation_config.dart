import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/features/address_screen/address_screen.dart';
import 'package:shop_stor/features/auth/login_screen.dart';
import 'package:shop_stor/features/auth/register_screen.dart';
import 'package:shop_stor/features/home_screen/home_screen.dart';
import 'package:shop_stor/features/main_screen/main_screen.dart';
import 'package:shop_stor/features/prodect_screen/prodect_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: AppRoutes.loginScreen,
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.regesterScreen,
        name: AppRoutes.regesterScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.mianScreen,
        name: AppRoutes.mianScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.prodectScreen,
        name: AppRoutes.prodectScreen,
        builder: (context, state) => const ProdectScreen(),
      ),
      GoRoute(
        path: AppRoutes.addressScreen,
        name: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.cartScreen,
      //   name: AppRoutes.cartScreen,
      //   builder: (context, state) => const CartScreen(),
      // ),
    ],
  );
}
