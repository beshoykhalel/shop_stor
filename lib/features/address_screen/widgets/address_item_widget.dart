import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';

class AddressItemWidget extends StatelessWidget {
  final String address;
  final String addressDetails;
  const AddressItemWidget(
      {super.key, required this.address, required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(
                Icons.place_outlined,
                size: 24.sp,
                color: Color(0xff999999),
              ),
              const WidthSpace(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: AppStyles.black15BoldStyle,
                  ),
                  const HeightSpace(4),
                  Text(
                    addressDetails,
                    style: AppStyles.graymediumstyle.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
