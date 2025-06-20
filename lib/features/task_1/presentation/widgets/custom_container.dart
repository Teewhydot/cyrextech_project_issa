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
  final bool skew, hasShadow;
  final double skewValue;
  final List<double> stops;
  final Alignment begin, end;

  const SkewedContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 10.0,
    this.skewValue = 0.20,
    this.child = const SizedBox.shrink(),
    this.primaryBgGradientColor = kPictionBlue,
    this.secondaryBgGradientColor = kMajorelleBlue,
    this.primaryGradientColor = kPictionBlue,
    this.secondaryGradientColor = kMajorelleBlue,
    this.skew = false,
    this.hasShadow = false,
    this.stops = const [0.2, 0.55],
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomRight,
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
            transform: skew ? Matrix4.skewY(-skewValue) : Matrix4.identity(),
            child: Container(
              padding: EdgeInsets.all(1.5),
              height: height.h,
              width: width.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryBgGradientColor, secondaryBgGradientColor],
                  begin: begin,
                  end: end,
                  stops: stops,
                ),
                borderRadius: BorderRadius.circular(borderRadius.r),
                boxShadow: [
                  if (hasShadow) ...[
                    BoxShadow(
                      color: kBlack,
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: Offset(0, 20), // changes position of shadow
                    ),
                  ],
                ],
              ),
              child: Container(
                height: height.h,
                width: width.h,
                decoration: BoxDecoration(
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
