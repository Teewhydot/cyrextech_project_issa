import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../widgets/custom_container.dart';

class BicycleHome extends StatelessWidget {
  const BicycleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kCharcoal,
          body: SingleChildScrollView(
            child: Column(
              children: [
                100.verticalSpace,
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
            ),
          ),
        ),
        // CustomAsset(
        //   assetPath: Assets.svgsBgRectangle,
        //   assetType: AssetType.svg,
        //   width: 453,
        //   height: 720,
        // ),
      ],
    );
  }
}
