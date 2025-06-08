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
import '../widgets/home_card.dart';

class BicycleHome extends StatelessWidget {
  const BicycleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
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
                Header(),
                20.verticalSpace,
                HomeCard(),
                SkewedContainerStack(),
                10.verticalSpace,
                Stack(
                  alignment: Alignment.topRight,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: SkewedContainer(
                        width: 165,
                        height: 235,
                        skew: true,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: SkewedContainer(
                        width: 165,
                        height: 219,
                        skew: true,
                      ),
                    ),
                  ],
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
