import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:cyrextech_project_issa/core/extensions.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/custom_container.dart';
import 'package:cyrextech_project_issa/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../widgets/custom_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool expanded = false;
  int _activeIndex = 0; // 0 for Description, 1 for Specification

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(width: 1.sw, height: 1.sh, color: kGunMetalColor),
          Positioned(
            right: 0,
            child: CustomAsset(
              assetPath: Assets.svgsProductDetailsBg,
              assetType: AssetType.svg,
              height: 865,
            ),
          ).animate().fade(duration: 1000.ms),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkewedContainer(
                      width: 44,
                      height: 44,
                      hasShadow: true,
                      child: CustomAsset(
                        assetPath:
                            expanded
                                ? Assets.svgsArrowDown
                                : Assets.svgsArrowBack,
                        assetType: AssetType.svg,
                        width: 20,
                        height: 20,
                      ),
                    ).onTap(() {
                      if (expanded) {
                        setState(() {
                          expanded = false;
                          _activeIndex = 0;
                        });
                      } else {
                        Get.back();
                      }
                    }),
                    CustomText(
                      text: "PEUGEOT - LR01",
                      fontSize: 20.sp,
                      color: kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  27.verticalSpace,
                  AnimatedScale(
                    scale: expanded ? 0.6 : 1.0,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    child: AnimatedSlide(
                      offset: expanded ? Offset(0, -1.5) : Offset.zero,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: Center(
                        child: CustomAsset(
                          assetPath: Assets.imagesElectricBikeLong1,
                          assetType: AssetType.image,
                          width: 1.sw,
                          height: 289.h,
                        ).animate().slideX(duration: 500.ms, begin: -1, end: 0),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  AnimatedSlide(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    offset: expanded ? Offset(0, -35) : Offset.zero,
                    child: Visibility(
                      visible: expanded,
                      child: Row(
                        spacing: 7,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 4, backgroundColor: kWhite),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: kWhite.withOpacity(0.2),
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: kWhite.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  50.verticalSpace,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: 200.ms,
              height: expanded ? 450 : 100,
              width: 1.sw,
              decoration: BoxDecoration(
                color: kCharcoal,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                border: Border.all(color: kWhite.withOpacity(0.1), width: 1.w),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (expanded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            32.verticalSpace,
                            Row(
                              spacing: 30,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  text: "Description",
                                  isActive: _activeIndex == 1,
                                  onTap: () {
                                    setState(() {
                                      _activeIndex = 1;
                                      expanded = true;
                                    });
                                  },
                                ),
                                CustomButton(
                                  text: "Specification",
                                  isActive: _activeIndex == 2,
                                  onTap: () {
                                    setState(() {
                                      _activeIndex = 2;
                                    });
                                  },
                                ),
                              ],
                            ),
                            29.verticalSpace,
                            CustomText(
                              text: "PEUGEOT - LR01",
                              fontSize: 20.sp,
                              color: kWhite,
                              alignment: MainAxisAlignment.start,
                            ),
                            if (_activeIndex == 1)
                              CustomWrapText(
                                text:
                                    "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: kWhite.withOpacity(0.8),
                                textAlign: TextAlign.start,
                              )
                            else
                              CustomWrapText(
                                text:
                                    "Motor: 250W Brushless Motor\nBattery: 36V 10Ah Lithium-Ion\nRange: Up to 50 miles\nFrame: Lightweight Aluminum\nBrakes: Front and Rear Disc Brakes\nWeight: Approximately 50 lbs",
                                fontSize: 14.sp,
                                color: kWhite.withOpacity(0.8),
                                textAlign: TextAlign.start,
                              ),
                          ],
                        ).paddingSymmetric(horizontal: 20.w),
                        Container(
                          width: 1.sw,
                          height: 104.h,
                          decoration: BoxDecoration(
                            color: kCharcoal,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50.r),
                              bottom: Radius.circular(50.r),
                            ),
                            border: Border.all(
                              color: kWhite.withOpacity(0.1),
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "\$1,999",
                                fontSize: 24.sp,
                                color: kPictionBlue,
                                fontWeight: FontWeight.normal,
                              ),
                              SkewedContainer(
                                width: 160,
                                height: 44,
                                child: CustomText(
                                  text: "Add to Cart",
                                  color: kWhite,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  alignment: MainAxisAlignment.center,
                                ),
                              ),
                            ],
                          ).paddingAll(35.r),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      spacing: 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "Description",
                          isActive: _activeIndex == 1,
                          textFontWeight: FontWeight.normal,
                          onTap: () {
                            setState(() {
                              _activeIndex = 1;
                              expanded = true;
                            });
                          },
                        ),
                        CustomButton(
                          text: "Specification",
                          isActive: _activeIndex == 2,
                          textFontWeight: FontWeight.normal,

                          onTap: () {
                            setState(() {
                              _activeIndex = 2;
                            });
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
