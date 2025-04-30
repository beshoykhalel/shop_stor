import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_stor/core/routing/app_routes.dart';
import 'package:shop_stor/core/styling/app_colors.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/custom_text_field.dart';
import 'package:shop_stor/core/widgets/loading_widget.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/home_screen/cubit/categories_cubit.dart';
import 'package:shop_stor/features/home_screen/cubit/categories_state.dart';
import 'package:shop_stor/features/home_screen/cubit/proudect_cubit.dart';
import 'package:shop_stor/features/home_screen/cubit/proudect_state.dart';
import 'package:shop_stor/features/home_screen/models/proudects_model.dart';
import 'package:shop_stor/features/home_screen/widgets/category_item_widget.dart';
import 'package:shop_stor/features/home_screen/widgets/prodect_widget_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectCat = "All";
  @override
  void initState() {
    context.read<ProudectCubit>().fetchProdects();
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

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
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: state.categories.map((cat) {
                    return CategoryItemWidget(
                      categoryName: cat,
                      isSelected: selectCat == cat ? true : false,
                      onPress: () {
                        setState(() {
                          selectCat = cat;
                          if (selectCat == "All") {
                            context.read<ProudectCubit>().fetchProdects();
                          } else {
                            context
                                .read<ProudectCubit>()
                                .fetchProdectCategories(cat);
                          }
                        });
                      },
                    );
                  }).toList()

                      //  [
                      //   CategoryItemWidget(
                      //     categoryName: "All",
                      //   ),
                      //   CategoryItemWidget(
                      //     categoryName: "Tshirts",
                      //   ),
                      //   CategoryItemWidget(
                      //     categoryName: "Jeans",
                      //   ),
                      //   CategoryItemWidget(
                      //     categoryName: "Shoes",
                      //   ),
                      //   CategoryItemWidget(
                      //     categoryName: "Tshirts",
                      //   ),
                      //   CategoryItemWidget(
                      //     categoryName: "Tshirts",
                      //   ),
                      //   CategoryItemWidget(
                      //     categoryName: "Tshirts",
                      //   ),
                      // ],
                      ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const HeightSpace(16),
          BlocBuilder<ProudectCubit, ProudectState>(
            builder: (context, state) {
              if (state is ProudectLoading) {
                return LoadingWidget(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.5,
                );
              }
              if (state is ProudectLoaded) {
                List<ProductsModel> proudects = state.proudects;
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    onRefresh: () async {
                      selectCat = "All";
                      setState(() {});
                      context.read<ProudectCubit>().fetchProdects();
                    },
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.sp,
                          mainAxisSpacing: 16.sp,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: proudects.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: ProdectWidgetItem(
                                  title: proudects[index].title ?? "",
                                  price: proudects[index].price.toString(),
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                        AppRoutes.prodectScreen,
                                        extra: proudects[index]);
                                  },
                                  image: proudects[index].image ?? "",
                                ),
                              ),
                            ),
                          );
                        },
                        // children: proudects.map((proudect) {
                        //   return ProdectWidgetItem(
                        //     title: proudect.title ?? "",
                        //     price: proudect.price.toString(),
                        //     onTap: () {
                        //       GoRouter.of(context).pushNamed(
                        //           AppRoutes.prodectScreen,
                        //           extra: proudect);
                        //     },
                        //     image: proudect.image ?? "",
                        //   );
                        // }).toList(),

                        // [

                        //   ProdectWidgetItem(
                        //     image: AppAssets.shopShoz,
                        //     title: 'T Shirt',
                        //     price: "\$ 1,190",
                        //     onTap: () {
                        //       GoRouter.of(context)
                        //           .pushNamed(AppRoutes.prodectScreen);
                        //     },
                        //   ),
                        //   ProdectWidgetItem(
                        //     image: AppAssets.shopTeshert,
                        //     title: 'T Shirt',
                        //     price: "\$ 1,190",
                        //     onTap: () {
                        //       GoRouter.of(context)
                        //           .pushNamed(AppRoutes.prodectScreen);
                        //     },
                        //   ),
                        //   ProdectWidgetItem(
                        //     image: AppAssets.shopTeshert,
                        //     title: 'T Shirt',
                        //     price: "\$ 1,190",
                        //     onTap: () {
                        //       GoRouter.of(context)
                        //           .pushNamed(AppRoutes.prodectScreen);
                        //     },
                        //   ),
                        //   ProdectWidgetItem(
                        //     image: AppAssets.shopShoz,
                        //     title: 'T Shirt',
                        //     price: "\$ 1,190",
                        //     onTap: () {
                        //       GoRouter.of(context)
                        //           .pushNamed(AppRoutes.prodectScreen);
                        //     },
                        //   ),
                        //   ProdectWidgetItem(
                        //     image: AppAssets.shopShoz,
                        //     title: 'T Shirt',
                        //     price: "\$ 1,190",
                        //     onTap: () {
                        //       GoRouter.of(context)
                        //           .pushNamed(AppRoutes.prodectScreen);
                        //     },
                        //   ),
                        //   ProdectWidgetItem(
                        //     image: AppAssets.shopTeshert,
                        //     title: 'T Shirt',
                        //     price: "\$ 1,190",
                        //     onTap: () {
                        //       GoRouter.of(context)
                        //           .pushNamed(AppRoutes.prodectScreen);
                        //     },
                        //   ),
                        // ],
                      ),
                    ),
                  ),
                );
              }
              return Text("there is an error");
            },
          ),
        ],
      ),
    );
  }
}
