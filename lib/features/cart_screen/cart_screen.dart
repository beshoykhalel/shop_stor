import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/primary_button_widget.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/cart_screen/widgets/cart_item_widget.dart';
import 'package:shop_stor/features/cart_screen/widgets/title_price_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: AppStyles.secondaryPrimaryHeadLinesStyle,
        ),
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpace(20),
              CartItemWidget(),
              CartItemWidget(),
              CartItemWidget(),
              const HeightSpace(20),
              TitlePriceWidget(
                title: 'Sub-total',
                price: '\$ 5,870',
              ),
              TitlePriceWidget(
                title: 'VAT (%)',
                price: '\$ 0.00',
              ),
              TitlePriceWidget(
                title: 'Shipping fee',
                price: '\$ 80',
              ),
              Divider(),
              const HeightSpace(16),
              TotalPriceWidget(
                title: 'Total',
                price: '\$ 5,950',
              ),
              const HeightSpace(16),
              PrimaryButtonWidget(
                  onPressed: () {},
                  trailingIcon: Icon(
                    Icons.payment,
                    size: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                  buttonText: "Go To Checkout",
                  buttonColor: AppColors.primaryColor),
              const HeightSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
