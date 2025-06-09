import 'dart:ui';

import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:cyrextech_project_issa/core/extensions.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:cyrextech_project_issa/features/task_1/domain/models/product.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/views/product_details.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/bottom_nav_widget.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/custom_container.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/skewed_container_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../widgets/home_card.dart';

class BicycleHome extends StatelessWidget {
  const BicycleHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(
        name: "PEUGEOT - LR01",
        category: "Road Bike",
        price: 1999.99,
        isFavourite: true,
      ),
      Product(
        name: "SWITCH - Trade",
        category: "Road Helmet",
        price: 200,
        isFavourite: false,
      ),
      Product(
        name: "PEUGEOT - LR01",
        category: "Road Bike",
        price: 1999.99,
        isFavourite: true,
      ),
      Product(
        name: "SWITCH - Trade",
        category: "Road Helmet",
        price: 200,
        isFavourite: false,
      ),
    ];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(width: 1.sw, height: 1.sh, color: kGunMetalColor),
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomAsset(
            assetPath: Assets.svgsBgRectangle,
            assetType: AssetType.svg,
            height: 720,
          ),
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: SizedBox(width: 1.sw, height: 300), // Adjust blur intensity
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                20.verticalSpace,
                HomeCard().onTap(() {
                  Get.to(() => const ProductDetails());
                }),
                SkewedContainerStack(),
                SizedBox(
                  height: 1000.h,
                  child: Stack(
                    children:
                        products.asMap().entries.map((entry) {
                          int index = entry.key;
                          int row = index ~/ 2;
                          double top = row * 240 + (index.isEven ? 20 : 0);
                          return Positioned(
                            left: index.isEven ? 0 : null,
                            right: index.isOdd ? 0 : null,
                            top: top,
                            child: SkewedContainer(
                              width: 165,
                              skew: true,
                              skewValue: 0.1,
                              primaryBgGradientColor: kCharcoal,
                              secondaryBgGradientColor: kDeepGunMetalColor,
                              primaryGradientColor: kCharcoal,
                              secondaryGradientColor: kDeepGunMetalColor,
                              height: index.isEven ? 235 : 219,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomAsset(
                                    assetPath: Assets.svgsHeart,
                                    assetType: AssetType.svg,
                                    width: 17,
                                    height: 20,
                                    svgAlignment: Alignment.topRight,
                                    svgAssetColor:
                                        products[index].isFavourite
                                            ? kPictionBlue
                                            : kWhite,
                                  ),
                                  CustomAsset(
                                    assetPath: Assets.imagesElectricBikeLong1,
                                    assetType: AssetType.image,
                                    width: 121,
                                    height: 88,
                                  ),
                                  17.verticalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: products[index].category,
                                        fontSize: 13,
                                        color: kWhite.withOpacity(0.5),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        text: products[index].name,
                                        fontSize: 15,
                                        color: kWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomText(
                                        text: "\$${products[index].price}",
                                        fontSize: 13,
                                        color: kWhite,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ).paddingOnly(top: 25),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ).paddingAll(20),
          ),
        ),
        Positioned(left: 0, right: 0, bottom: -10, child: BottomNavWidget()),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Choose your Bike",
          fontSize: 20,
          color: kWhite,
          fontWeight: FontWeight.w700,
        ),
        SkewedContainer(
          width: 44,
          height: 44,
          child: CustomAsset(
            assetPath: Assets.svgsSearch,
            assetType: AssetType.svg,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
