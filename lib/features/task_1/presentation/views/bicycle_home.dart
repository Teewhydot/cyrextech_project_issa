import 'dart:ui';

import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/bottom_nav_widget.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/custom_container.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/skewed_container_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';

class BicycleHome extends StatelessWidget {
  const BicycleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 1.sw, height: 1.sh, color: kCharcoal),
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
          borderRadius: BorderRadius.circular(20.r), // Adjust as needed
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: SizedBox(width: 1.sw, height: 320), // Adjust blur intensity
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                ),
                20.verticalSpace,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomAsset(
                      assetPath: Assets.svgsCustomHomeCard,
                      assetType: AssetType.svg,
                      width: 1.sw,
                      height: 250,
                    ),
                    Positioned(
                      top: 30.h,
                      left: 17.w,
                      right: 17.w,
                      child: CustomAsset(
                        assetPath: Assets.imagesElectricBikeShort1,
                        assetType: AssetType.image,
                        height: 153,
                      ),
                    ),
                    Positioned(
                      top: 177.h,
                      left: 17.w,
                      right: 17.w,
                      child: CustomText(
                        text: "30 % OFF",
                        fontSize: 26,
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        alignment: MainAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
                SkewedContainerStack(),
                0.verticalSpace,
                Transform(
                  transform: Matrix4.skewX(
                    -0.3,
                  ), // Adjust the skew value as needed
                  child: Wrap(
                    spacing: 20.w, // Horizontal space between items
                    children: [
                      // Your widgets here
                      Container(width: 100, height: 100, color: Colors.red),
                      Container(width: 100, height: 80, color: Colors.blue),
                      // Add more widgets as needed
                    ],
                  ),
                ),
              ],
            ).paddingAll(20),
          ),
        ),
        Positioned(bottom: -10, child: BottomNavWidget()),
      ],
    );
  }
}
