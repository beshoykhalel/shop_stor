import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/utils/animated_snak_dialog.dart';
import 'package:shop_stor/core/widgets/primary_button_widget.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/cart_screen/cubit/cart_cubit.dart';
import 'package:shop_stor/features/cart_screen/cubit/cart_state.dart';
import 'package:shop_stor/features/home_screen/models/proudects_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel proudect;
  const ProductScreen({super.key, required this.proudect});

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
                    child: Hero(
                        tag: "product${proudect.title}",
                        child:
                            CachedNetworkImage(imageUrl: proudect.image ?? "")),
                  ),
                  const HeightSpace(12),
                  Text(
                    proudect.title ?? "",
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
                      proudect.rating != null
                          ? Text(
                              "${proudect.rating!.rate}/5  ",
                              style: AppStyles.black15BoldStyle.copyWith(
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline),
                            )
                          : const SizedBox.shrink(),
                      proudect.rating != null
                          ? Text(
                              "(${proudect.rating!.count} Reviews)",
                              style: AppStyles.graymediumstyle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const HeightSpace(13),
                  Text(
                    proudect.description ?? "",
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
                              "\$ ${proudect.price}",
                              style: AppStyles.black15BoldStyle.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                        const WidthSpace(50),
                        BlocConsumer<CartCubit, CartState>(
                          listener: (context, state) {
                            if (state is SuccessAddingToCarts) {
                              showAnimatedSnakDialog(context,
                                  message:
                                      "Product Add Successfully To Our Cart",
                                  type: AnimatedSnackBarType.success);
                            }
                          },
                          builder: (context, state) {
                            if (state is AddingToCarts) {
                              return PrimaryButtonWidget(
                                  onPressed: () {},
                                  width: 170.w,
                                  heithg: 54.h,
                                  isLoading: true,
                                  buttonText: "Add to Cart",
                                  buttonColor: AppColors.primaryColor);
                            }

                            return PrimaryButtonWidget(
                                onPressed: () {
                                  context.read<CartCubit>().addingToCarts(
                                      product: proudect, quantity: 1);
                                },
                                width: 170.w,
                                heithg: 54.h,
                                icon: Icon(
                                  Icons.shopping_cart,
                                  size: 16.sp,
                                  color: AppColors.whiteColor,
                                ),
                                buttonText: "Add to Cart",
                                buttonColor: AppColors.primaryColor);
                          },
                        )
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
