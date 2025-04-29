import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_assets.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/cart_screen/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child: Image.asset(
                AppAssets.shopTeshert,
                width: 83.w,
                height: 79.h,
              ),
            ),
            const WidthSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Item ${product.productId}",
                        style: AppStyles.black15BoldStyle,
                      ),
                      // const WidthSpace(50),
                      Spacer(),
                      Icon(
                        Icons.delete,
                        color: AppColors.redColor,
                      )
                    ],
                  ),
                  const HeightSpace(30),
                  Row(
                    children: [
                      Text(
                        "\$ 1,100",
                        style: AppStyles.black15BoldStyle,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grayColor, width: 1),
                                  borderRadius: BorderRadius.circular(3.r)),
                              child: Icon(
                                Icons.add,
                                color: AppColors.balckColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          const WidthSpace(8),
                          Text(
                            "1",
                            style: AppStyles.black15BoldStyle,
                          ),
                          const WidthSpace(8),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grayColor, width: 1),
                                  borderRadius: BorderRadius.circular(3.r)),
                              child: Icon(
                                Icons.remove,
                                color: AppColors.balckColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
