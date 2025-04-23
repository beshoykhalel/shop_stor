import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_stor/core/styling/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const LoadingWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      child: Center(
        child: LottieBuilder.asset(
          AppAssets.loading,
          width: 150.w,
          height: 150.w,
        ),
      ),
    );
  }
}
