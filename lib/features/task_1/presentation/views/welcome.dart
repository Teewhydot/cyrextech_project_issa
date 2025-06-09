import 'dart:ui';

import 'package:cyrextech_project_issa/core/extensions.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/views/bicycle_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/image.dart';
import '../../../../components/texts.dart';
import '../../../../core/theme/colors.dart';
import '../../../../generated/assets.dart';
import '../../../task_2/presentation/views/rick_and_morty.dart';
import '../widgets/custom_container.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
            child: SizedBox(width: 1.sw, height: 1.sh), // Adjust blur intensity
          ),
        ),
        Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkewedContainer(
              width: 160,
              height: 44,
              hasShadow: true,
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.89],
              child: CustomText(
                text: "Task 1",
                color: kWhite,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                alignment: MainAxisAlignment.center,
              ),
            ).onTap(() {
              Get.to(() => const BicycleHome());
            }),
            SkewedContainer(
              width: 160,
              height: 44,
              hasShadow: true,
              child: CustomText(
                text: "Task 2",
                color: kWhite,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                alignment: MainAxisAlignment.center,
              ),
            ).onTap(() {
              Get.to(() => const RickAndMortyApiTask());
            }),
          ],
        ),
      ],
    );
  }
}
