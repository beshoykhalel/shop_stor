import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? heithg;
  final double? fontSize;
  final double? bordersRedius;
  final void Function()? onPressed;
  final Widget? icon;
  final Widget? trailingIcon;
  const PrimaryButtonWidget(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      this.width,
      this.heithg,
      this.bordersRedius,
      this.textColor,
      this.onPressed,
      this.fontSize,
      this.icon,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bordersRedius ?? 8.r)),
            fixedSize: Size(width ?? 331.w, heithg ?? 56.h)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : const SizedBox.shrink(),
            icon != null ? const WidthSpace(8) : const SizedBox.shrink(),
            Text(
              buttonText ?? "",
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize ?? 16.sp),
            ),
            const WidthSpace(8),
            trailingIcon != null ? trailingIcon! : const SizedBox.shrink(),
            trailingIcon != null
                ? const WidthSpace(8)
                : const SizedBox.shrink(),
          ],
        ));
  }
}
