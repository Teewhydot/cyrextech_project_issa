import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum AssetType { image, svg }

class CustomAsset extends StatelessWidget {
  final String assetPath;
  final double width, height, borderRadius;
  final BoxFit fit;
  final AssetType assetType;
  final Color? svgAssetColor;
  final MainAxisAlignment imageAlignment = MainAxisAlignment.center;
  final Alignment svgAlignment;

  const CustomAsset({
    super.key,
    required this.assetPath,
    this.width = 100.0,
    this.height = 100.0,
    this.borderRadius = 0.0,
    this.svgAssetColor,
    this.fit = BoxFit.cover,
    this.assetType = AssetType.image,
    this.svgAlignment = Alignment.center,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: switch (assetType) {
        AssetType.image => Image.asset(
          assetPath,
          width: width.w,
          height: height.w,
          fit: fit,
        ),

        AssetType.svg => Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            assetPath,
            width: width.w,
            height: height.h,
            color: svgAssetColor,
            alignment: svgAlignment,
          ),
        ),
      },
    );
  }
}
