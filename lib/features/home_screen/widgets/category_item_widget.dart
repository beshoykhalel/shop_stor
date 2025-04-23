import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_styles.dart';

class CategoryItemWidget extends StatelessWidget {
  final String? categoryName;
  const CategoryItemWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w),
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          categoryName!,
          style: AppStyles.secondaryPrimaryHeadLinesStyle
              .copyWith(fontSize: 16.sp),
        ),
      ),
    );
  }
}
