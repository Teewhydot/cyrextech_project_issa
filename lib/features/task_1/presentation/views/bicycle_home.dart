import 'dart:ui';

import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../widgets/bottom_nav_widget.dart';

class BicycleHome extends StatelessWidget {
  const BicycleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCharcoal,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomAsset(
              assetPath: Assets.svgsBgRectangle,
              assetType: AssetType.svg,
              width: 453,
              height: 720,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r), // Adjust as needed
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: SizedBox(
                width: 1.sw,
                height: 300,
              ), // Adjust blur intensity
            ),
          ),
          Column(
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
                    height: 290,
                    // color: Colors.white.withOpacity(0.1), // Optional: add a semi-transparent color overlay
                  ),
                  Positioned(
                    top: 20,
                    left: 17,
                    right: 17,
                    child: CustomAsset(
                      assetPath: Assets.imagesElectricBikeShort1,
                      assetType: AssetType.image,
                      height: 153,
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 17,
                    right: 17,
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
              SkewedContainer(
                width: 70,
                height: 60,
                primaryBgGradientColor: kPictionBlue,
                secondaryBgGradientColor: kMajorelleBlue,
                primaryGradientColor: kPictionBlue,
                secondaryGradientColor: kMajorelleBlue,
                skew: true,
                borderRadius: 10.r,
                child: CustomAsset(
                  assetPath: Assets.svgsBicycle,
                  assetType: AssetType.svg,
                  width: 28,
                  height: 17,
                ),
              ),
            ],
          ).paddingAll(20),
          Positioned(bottom: 0, child: BottomNavWidget()),
        ],
      ),
    );
  }
}
