import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';

class AccountItemWidget extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final VoidCallback? onTap;
  const AccountItemWidget(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: InkWell(
        onTap: onTap ?? () {},
        child: Row(
          children: [
            Row(
              children: [
                iconPath == null
                    ? const SizedBox.shrink()
                    : Image.asset(
                        iconPath!,
                        width: 24.w,
                      ),
                const WidthSpace(16),
                Text(
                  title ?? "",
                  style: AppStyles.subtitlesStyles
                      .copyWith(color: AppColors.balckColor),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 24.sp,
              color: AppColors.grayColor,
            )
          ],
        ),
      ),
    );
  }
}
