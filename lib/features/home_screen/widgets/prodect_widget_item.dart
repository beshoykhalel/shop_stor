import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';

class ProdectWidgetItem extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final Function()? onTap;
  const ProdectWidgetItem(
      {super.key,
      required this.title,
      required this.price,
      this.onTap,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: image!,
                height: 150.h,
                width: 150.w,
                fit: BoxFit.cover,
              ),
            ),
            const HeightSpace(16),
            Text(
              title!,
              maxLines: 1,
              style: AppStyles.black16w500style,
            ),
            const HeightSpace(3),
            Text(
              price!,
              style: AppStyles.graymediumstyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
