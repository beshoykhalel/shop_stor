import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/core/styling/app_assets.dart';
import 'package:shop_stor/core/utils/service_locator.dart';
import 'package:shop_stor/core/utils/storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500))
      ..repeat(reverse: true);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    waitAnimationAndNavigate();
    super.initState();
  }

  waitAnimationAndNavigate() async {
    await Future.delayed(Duration(seconds: 3));
    sl<StorageHelper>().getToken().then((value) {
      if (value != null && value.isNotEmpty) {
        context.pushReplacementNamed(AppRoutes.mianScreen);
      } else {
        context.pushReplacementNamed(AppRoutes.loginScreen);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(
            AppAssets.logo,
            width: 150.w,
            height: 150.h,
          ),
        ),
      ),
    );
  }
}
