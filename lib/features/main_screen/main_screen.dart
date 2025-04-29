import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/utils/service_locator.dart';
import 'package:shop_stor/features/account_screen/account_screen.dart';
import 'package:shop_stor/features/cart_screen/cart_screen.dart';
import 'package:shop_stor/features/cart_screen/cubit/cart_cubit.dart';
import 'package:shop_stor/features/home_screen/cubit/categories_cubit.dart';
import 'package:shop_stor/features/home_screen/cubit/proudect_cubit.dart';
import 'package:shop_stor/features/home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProudectCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesCubit>(),
        ),
      ],
      child: HomeScreen(),
    ),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 1,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });

            if (value == 1) {
              context.read<CartCubit>().fetchCarts();
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30.sp,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30.sp,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_4_rounded,
                  size: 30.sp,
                ),
                label: "Account"),
          ],
        ),
      ),
    );
  }
}
