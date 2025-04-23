import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_assets.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/primary_button_widget.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';

class ProdectScreen extends StatelessWidget {
  const ProdectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Details",
          style: AppStyles.secondaryPrimaryHeadLinesStyle,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(20),
                  Container(
                    width: 341.w,
                    height: 368.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image.asset(AppAssets.shopTeshert),
                  ),
                  const HeightSpace(12),
                  Text(
                    "Fit Polo T Shirt",
                    style: AppStyles.black15BoldStyle.copyWith(fontSize: 24.sp),
                  ),
                  const HeightSpace(12),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffFFA928),
                        size: 18.sp,
                      ),
                      WidthSpace(2),
                      Text(
                        "4.0/5  ",
                        style: AppStyles.black15BoldStyle.copyWith(
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        "(45 reviews)",
                        style: AppStyles.graymediumstyle.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const HeightSpace(13),
                  Text(
                    "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                    style: AppStyles.graymediumstyle.copyWith(fontSize: 16.sp),
                  ),
                  const HeightSpace(100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  Divider(),
                  const HeightSpace(10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: AppStyles.graymediumstyle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "\$ 1,190",
                              style: AppStyles.black15BoldStyle.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                        const WidthSpace(16),
                        PrimaryButtonWidget(
                            onPressed: () {},
                            width: 240.w,
                            heithg: 54.h,
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                            buttonText: "Add to Cart",
                            buttonColor: AppColors.primaryColor)
                      ],
                    ),
                  ),
                  const HeightSpace(10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
