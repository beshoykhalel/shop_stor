import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/core/styling/app_assets.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/account_screen/widgets/account_item_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Account",
          style: AppStyles.secondaryPrimaryHeadLinesStyle,
        ),
        leading: Container(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(),
          ),
          const HeightSpace(20),
          AccountItemWidget(
              title: "My Orders", iconPath: AppAssets.box, onTap: () {}),
          const HeightSpace(20),
          const Divider(
            thickness: 8,
            color: Color(0xffAAAAAA),
          ),
          const HeightSpace(20),
          AccountItemWidget(
              title: "My Details", iconPath: AppAssets.details, onTap: () {}),
          const HeightSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(),
          ),
          const HeightSpace(20),
          AccountItemWidget(
              title: "Address Book",
              iconPath: AppAssets.address,
              onTap: () {
                context.pushNamed(AppRoutes.addressScreen);
              }),
          const HeightSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(),
          ),
          const HeightSpace(20),
          AccountItemWidget(
              title: "FAQs", iconPath: AppAssets.question, onTap: () {}),
          const HeightSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(),
          ),
          const HeightSpace(20),
          AccountItemWidget(
              title: "Help Center", iconPath: AppAssets.help, onTap: () {}),
          const HeightSpace(20),
          const Divider(
            thickness: 8,
            color: Color(0xffE6E6E6),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: AppColors.redColor,
                    size: 24.sp,
                  ),
                  const WidthSpace(16),
                  Text(
                    "Logout",
                    style: AppStyles.black16w500style.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HeightSpace(75),
        ],
      ),
    );
  }
}
