import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/utils/animated_snak_dialog.dart';
import 'package:shop_stor/core/utils/service_locator.dart';
import 'package:shop_stor/core/utils/storage_helper.dart';
import 'package:shop_stor/core/widgets/custom_text_field.dart';
import 'package:shop_stor/core/widgets/loading_widget.dart';
import 'package:shop_stor/core/widgets/primary_button_widget.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/auth/cubit/auth_cubit.dart';
import 'package:shop_stor/features/auth/cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sl<AuthRepo>()
    //     .login("mor_2314", "83r5^_")
    //     .then((either.Either<String, LoginResponseModel> res) {
    //   res.fold((error) {
    //     showAnimatedSnakDialog(context,
    //         message: error, type: AnimatedSnackBarType.error);
    //     log(error);
    //   }, (right) {
    //     showAnimatedSnakDialog(context,
    //         message: "Login Successfully", type: AnimatedSnackBarType.success);
    //     log(right.toJson().toString());
    //   });
    //   setState(() {});
    // });
    userNameController = TextEditingController();
    password = TextEditingController();
    sl<StorageHelper>().getToken().then((value) {
      if (value != null && value.isNotEmpty) {
        context.pushReplacementNamed(AppRoutes.mianScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ErrorAuthState) {
              showAnimatedSnakDialog(context,
                  message: state.message, type: AnimatedSnackBarType.error);
            }
            if (state is SuccessAuthState) {
              showAnimatedSnakDialog(context,
                  message: state.message, type: AnimatedSnackBarType.success);
              // GoRouter.of(context).pushNamed(AppRoutes.mianScreen);
              context.pushReplacementNamed(AppRoutes.mianScreen);
            }
          },
          builder: (context, state) {
            if (state is LoadingAuthState) {
              return const LoadingWidget();
            }
            return Padding(
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
                          "Login to your account",
                          style: AppStyles.secondaryPrimaryHeadLinesStyle,
                        ),
                      ),
                      const HeightSpace(8),
                      SizedBox(
                        width: 335.w,
                        child: Text(
                          "It’s great to see you again.",
                          style: AppStyles.graymediumstyle,
                        ),
                      ),
                      const HeightSpace(32),
                      Text(
                        "User Name",
                        style: AppStyles.black16w500style,
                      ),
                      const HeightSpace(8),
                      CustomTextField(
                        controller: userNameController,
                        hintText: "Enter Your User Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your User Name";
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
                          if (value.length < 6) {
                            return "Password must have be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(55),
                      PrimaryButtonWidget(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login(
                                  userName: userNameController.text,
                                  password: password.text);
                            }

                            // context.pushNamed(AppRoutes.mianScreen);
                            // if (formKey.currentState!.validate()) {
                            //   GoRouter.of(context).pushNamed(AppRoutes.mianScreen);
                            // }
                          },
                          buttonText: "Sign In",
                          buttonColor: AppColors.primaryColor),
                      // const Spacer(),
                      const HeightSpace(345),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.regesterScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Don’t have an account? ",
                              style: AppStyles.black16w500style
                                  .copyWith(color: AppColors.scondryColor),
                              children: [
                                TextSpan(
                                  text: "Join",
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
            );
          },
        ),
      ),
    );
  }
}
