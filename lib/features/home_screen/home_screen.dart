import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/core/styling/app_assets.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/custom_text_field.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/home_screen/widgets/category_item_widget.dart';
import 'package:shop_stor/features/home_screen/widgets/prodect_widget_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(28),
          SizedBox(
            width: 335.w,
            child: Text("Discover",
                style: AppStyles.secondaryPrimaryHeadLinesStyle),
          ),
          const HeightSpace(16),
          Row(
            children: [
              CustomTextField(
                width: 281.w,
                hight: 52.h,
                hintText: "Search for clothes...",
              ),
              const WidthSpace(8),
              Container(
                width: 52.w,
                height: 53.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                ),
              )
            ],
          ),
          const HeightSpace(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItemWidget(
                  categoryName: "All",
                ),
                CategoryItemWidget(
                  categoryName: "Tshirts",
                ),
                CategoryItemWidget(
                  categoryName: "Jeans",
                ),
                CategoryItemWidget(
                  categoryName: "Shoes",
                ),
                CategoryItemWidget(
                  categoryName: "Tshirts",
                ),
                CategoryItemWidget(
                  categoryName: "Tshirts",
                ),
                CategoryItemWidget(
                  categoryName: "Tshirts",
                ),
              ],
            ),
          ),
          const HeightSpace(16),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.sp,
                mainAxisSpacing: 16.sp,
                childAspectRatio: 0.8,
              ),
              children: [
                ProdectWidgetItem(
                  image: AppAssets.shopShoz,
                  title: 'T Shirt',
                  price: "\$ 1,190",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.prodectScreen);
                  },
                ),
                ProdectWidgetItem(
                  image: AppAssets.shopTeshert,
                  title: 'T Shirt',
                  price: "\$ 1,190",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.prodectScreen);
                  },
                ),
                ProdectWidgetItem(
                  image: AppAssets.shopTeshert,
                  title: 'T Shirt',
                  price: "\$ 1,190",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.prodectScreen);
                  },
                ),
                ProdectWidgetItem(
                  image: AppAssets.shopShoz,
                  title: 'T Shirt',
                  price: "\$ 1,190",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.prodectScreen);
                  },
                ),
                ProdectWidgetItem(
                  image: AppAssets.shopShoz,
                  title: 'T Shirt',
                  price: "\$ 1,190",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.prodectScreen);
                  },
                ),
                ProdectWidgetItem(
                  image: AppAssets.shopTeshert,
                  title: 'T Shirt',
                  price: "\$ 1,190",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.prodectScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
