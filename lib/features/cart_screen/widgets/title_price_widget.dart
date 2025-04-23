import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_styles.dart';

class TitlePriceWidget extends StatelessWidget {
  final String title;
  final String price;
  const TitlePriceWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.graymediumstyle.copyWith(fontSize: 16.sp),
          ),
          Spacer(),
          Text(
            price,
            style: AppStyles.black16w500style,
          ),
        ],
      ),
    );
  }
}

class TotalPriceWidget extends StatelessWidget {
  final String title;
  final String price;
  const TotalPriceWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.black16w500style
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(price,
              style: AppStyles.secondaryPrimaryHeadLinesStyle
                  .copyWith(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
