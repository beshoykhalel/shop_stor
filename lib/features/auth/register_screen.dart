import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/custom_text_field.dart';
import 'package:shop_stor/core/widgets/primary_button_widget.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController userNameControlleer;
  late TextEditingController fullNameControlleer;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameControlleer = TextEditingController();
    fullNameControlleer = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(28),
                  SizedBox(
                    width: 335.w,
                    child: Text(
                      "Create an account",
                      style: AppStyles.secondaryPrimaryHeadLinesStyle,
                    ),
                  ),
                  const HeightSpace(8),
                  SizedBox(
                    width: 335.w,
                    child: Text(
                      "Let’s create your account.",
                      style: AppStyles.graymediumstyle,
                    ),
                  ),
                  const HeightSpace(32),
                  Text(
                    "Full Name",
                    style: AppStyles.black16w500style,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    controller: fullNameControlleer,
                    hintText: "Enter your full name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your full name";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(16),
                  Text(
                    "User Name",
                    style: AppStyles.black16w500style,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    controller: userNameControlleer,
                    hintText: "Enter your email address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email address";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(16),
                  Text(
                    "Password",
                    style: AppStyles.black16w500style,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    hintText: "Enter Your Password",
                    controller: password,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.grayColor,
                        size: 20.sp,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      }
                      if (value.length < 8) {
                        return "Password must have be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(16),
                  Text(
                    "Confirm Password",
                    style: AppStyles.black16w500style,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    hintText: "Enter your password",
                    controller: confirmPassword,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.grayColor,
                        size: 20.sp,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your password";
                      }
                      if (value.length < 8) {
                        return "Password must have be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(55),
                  PrimaryButtonWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // GoRouter.of(context).pushNamed(AppRoutes.mianScreen);
                        }
                      },
                      buttonText: "Sign In",
                      buttonColor: AppColors.primaryColor),
                  // const Spacer(),
                  const HeightSpace(120),
                  Center(
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: AppStyles.black16w500style
                              .copyWith(color: AppColors.scondryColor),
                          children: [
                            TextSpan(
                              text: " Log In",
                              style: AppStyles.black15BoldStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const HeightSpace(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
