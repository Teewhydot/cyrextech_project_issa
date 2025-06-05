import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkewedContainer extends StatelessWidget {
  final double width, height, borderRadius;
  final Widget child;
  final Color primaryBgGradientColor,
      secondaryBgGradientColor,
      primaryGradientColor,
      secondaryGradientColor;
  final bool skew;

  const SkewedContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 10.0,
    this.child = const SizedBox.shrink(),
    required this.primaryBgGradientColor,
    required this.secondaryBgGradientColor,
    required this.primaryGradientColor,
    required this.secondaryGradientColor,
    this.skew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(0, skew ? height.h * 0.12 : 0),
          child: Transform(
            transform: skew ? Matrix4.skewY(-0.20) : Matrix4.identity(),
            child: Container(
              padding: EdgeInsets.all(1.5),
              height: height.h,
              width: width.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryBgGradientColor, secondaryBgGradientColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  stops: [0.2, 0.55],
                ),
                borderRadius: BorderRadius.circular(borderRadius.r),
              ),
              child: Container(
                height: height.h,
                width: width.h,
                decoration: BoxDecoration(
                  color: kWhite,
                  gradient: LinearGradient(
                    colors: [primaryGradientColor, secondaryGradientColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius.r),
                ),
              ),
            ),
          ),
        ),
        Align(alignment: Alignment.center, child: child),
      ],
    );
  }
}
