import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/custom_button.dart';
import 'package:cyrextech_project_issa/features/task_1/presentation/widgets/custom_container.dart';
import 'package:cyrextech_project_issa/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 1.sw, height: 1.sh, color: kCharcoal),
        Positioned(
          bottom: 0,
          top: -230,
          right: 0,
          child: CustomAsset(
            assetPath: Assets.svgsBgRectangle,
            assetType: AssetType.svg,
            height: 720,
          ),
        ),

        //body
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkewedContainer(
                      width: 44,
                      height: 44,
                      hasShadow: true,
                      child: CustomAsset(
                        assetPath: Assets.svgsArrowBack,
                        assetType: AssetType.svg,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    CustomText(
                      text: "PEUGEOT 208",
                      fontSize: 20.sp,
                      color: kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
                27.verticalSpace,
                CustomAsset(
                  assetPath: Assets.imagesElectricBikeLong1,
                  assetType: AssetType.image,
                  width: 284.w,
                  height: 208.h,
                ),
                24.verticalSpace,
                Row(
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
                50.verticalSpace,
                Expanded(child: NeurmorphicDetailsContainer()),
              ],
            ),
          ),
        ),

        //bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: kCharcoal,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
              border: Border.all(color: kWhite.withOpacity(0.1), width: 1.w),
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
        ),
      ],
    );
  }
}
// in lib/features/task_2/presentation/views/product_details.dart

class NeurmorphicDetailsContainer extends StatefulWidget {
  const NeurmorphicDetailsContainer({super.key});

  @override
  State<NeurmorphicDetailsContainer> createState() =>
      _NeurmorphicDetailsContainerState();
}

class _NeurmorphicDetailsContainerState
    extends State<NeurmorphicDetailsContainer> {
  int _activeIndex = 0; // 0 for Description, 1 for Specification

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        border: Border.all(color: kWhite.withOpacity(0.1), width: 1.w),
        gradient: LinearGradient(
          colors: [kCharcoal, kGunMetalColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            32.verticalSpace,
            Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "Description",
                  isActive: _activeIndex == 0,
                  onTap: () {
                    setState(() {
                      _activeIndex = 0;
                    });
                  },
                ),
                CustomButton(
                  text: "Specification",
                  isActive: _activeIndex == 1,
                  onTap: () {
                    setState(() {
                      _activeIndex = 1;
                    });
                  },
                ),
              ],
            ),
            29.verticalSpace,
            CustomText(
              text: "PEUGEOT 208",
              fontSize: 20.sp,
              color: kWhite,
              alignment: MainAxisAlignment.start,
            ),
            if (_activeIndex == 0)
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
            100.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
