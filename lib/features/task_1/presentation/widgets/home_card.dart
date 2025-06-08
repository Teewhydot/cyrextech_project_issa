import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/image.dart';
import '../../../../components/texts.dart';
import '../../../../core/theme/colors.dart';
import '../../../../generated/assets.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(context.width);
        if (context.width < 300) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              CustomAsset(
                assetPath: Assets.svgsCustomHomeCard,
                assetType: AssetType.svg,
                width: 1.sw,
                height: 290,
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
                bottom: 30.h,
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
          );
        } else {
          return Stack(
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
                bottom: 30.h,
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
          );
        }
      },
    );
  }
}
