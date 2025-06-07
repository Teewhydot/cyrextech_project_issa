import 'dart:ui' as ui;

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
    this.primaryBgGradientColor = kPictionBlue,
    this.secondaryBgGradientColor = kMajorelleBlue,
    this.primaryGradientColor = kPictionBlue,
    this.secondaryGradientColor = kMajorelleBlue,
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

class OneSideSkewClipper extends CustomClipper<Path> {
  final double skewAmount;

  OneSideSkewClipper(this.skewAmount);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0); // Skewed top-right
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * (1 - skewAmount)); // Skewed bottom-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class SkewedContainerWithBorder extends StatelessWidget {
  final double skewAmount;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Widget child;

  const SkewedContainerWithBorder({
    super.key,
    required this.skewAmount,
    this.borderRadius = 10,
    this.borderColor = Colors.black,
    this.borderWidth = 1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      child: ClipPath(
        clipper: _RoundedSkewedClipper(
          skewAmount: skewAmount,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}

class _RoundedSkewedClipper extends CustomClipper<Path> {
  final double skewAmount;
  final double borderRadius;

  _RoundedSkewedClipper({required this.skewAmount, required this.borderRadius});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Top-left rounded corner
    path.moveTo(borderRadius, 0);
    path.arcToPoint(
      Offset(0, borderRadius),
      clockwise: false,
      radius: Radius.circular(borderRadius),
    );

    // Bottom-left with skew
    path.lineTo(0, size.height - borderRadius - (size.height * skewAmount));
    path.arcToPoint(
      Offset(borderRadius, size.height - (size.height * skewAmount)),
      clockwise: false,
      radius: Radius.circular(20),
    );

    // Bottom-right
    path.lineTo(size.width - borderRadius, size.height);
    path.arcToPoint(
      Offset(size.width, size.height - borderRadius),
      clockwise: false,
      radius: Radius.circular(borderRadius),
    );

    // Top-right
    path.lineTo(size.width, borderRadius);
    path.arcToPoint(
      Offset(size.width - borderRadius, 0),
      clockwise: false,
      radius: Radius.circular(borderRadius),
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _SkewedBorderPainter extends CustomPainter {
  final double skewAmount;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  _SkewedBorderPainter({
    required this.skewAmount,
    required this.borderRadius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth
          ..strokeJoin = StrokeJoin.round;

    final bw = borderWidth / 2;
    final path = Path();

    // Top-left rounded corner
    path.moveTo(borderRadius + bw, bw);
    path.arcToPoint(
      Offset(bw, borderRadius + bw),
      radius: Radius.circular(borderRadius),
      clockwise: false,
    );

    // Bottom-left with skew
    path.lineTo(
      bw,
      size.height - borderRadius - (size.height * skewAmount) - bw,
    );
    path.arcToPoint(
      Offset(borderRadius + bw, size.height - (size.height * skewAmount) - bw),
      radius: Radius.circular(borderRadius),
      clockwise: false,
    );

    // Bottom-right
    path.lineTo(size.width - borderRadius - bw, size.height - bw);
    path.arcToPoint(
      Offset(size.width - bw, size.height - borderRadius - bw),
      radius: Radius.circular(borderRadius),
      clockwise: false,
    );

    // Top-right
    path.lineTo(size.width - bw, borderRadius + bw);
    path.arcToPoint(
      Offset(size.width - borderRadius - bw, bw),
      radius: Radius.circular(borderRadius),
      clockwise: false,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// class _SkewedBorderPainter extends CustomPainter {
//   final double skewAmount;
//   final double borderRadius;
//   final Color borderColor;
//   final double borderWidth;
//
//   _SkewedBorderPainter({
//     required this.skewAmount,
//     required this.borderRadius,
//     required this.borderColor,
//     required this.borderWidth,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint =
//         Paint()
//           ..color = borderColor
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = borderWidth
//           ..strokeJoin = StrokeJoin.round;
//
//     final path = Path();
//
//     // Top-left rounded corner
//     path.moveTo(borderRadius, borderWidth / 2);
//     path.arcToPoint(
//       Offset(borderWidth / 2, borderRadius),
//       radius: Radius.circular(borderRadius),
//     );
//
//     // Bottom-left with skew
//     path.lineTo(
//       borderWidth / 2,
//       size.height - borderRadius - (size.height * skewAmount),
//     );
//     path.arcToPoint(
//       Offset(
//         borderRadius,
//         size.height - (size.height * skewAmount) - borderWidth / 2,
//       ),
//       radius: Radius.circular(borderRadius),
//     );
//
//     // Bottom-right
//     path.lineTo(size.width - borderRadius, size.height - borderWidth / 2);
//     path.arcToPoint(
//       Offset(size.width - borderWidth / 2, size.height - borderRadius),
//       radius: Radius.circular(borderRadius),
//     );
//
//     // Top-right
//     path.lineTo(size.width - borderWidth / 2, borderRadius);
//     path.arcToPoint(
//       Offset(size.width - borderRadius, borderWidth / 2),
//       radius: Radius.circular(borderRadius),
//     );
//
//     path.close();
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.05813953, 0);
    path_0.lineTo(size.width * 0.9418605, 0);
    path_0.arcToPoint(
      Offset(size.width, size.height * 0.08176615),
      radius: Radius.elliptical(
        size.width * 0.05843023,
        size.height * 0.08217498,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.lineTo(size.width, size.height * 0.6688471);
    path_0.arcToPoint(
      Offset(size.width * 0.9531977, size.height * 0.7489779),
      radius: Radius.elliptical(
        size.width * 0.05813953,
        size.height * 0.08176615,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.lineTo(size.width * 0.06947674, size.height * 0.9983647);
    path_0.arcToPoint(
      Offset(0, size.height * 0.9182339),
      radius: Radius.elliptical(
        size.width * 0.05813953,
        size.height * 0.08176615,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.lineTo(0, size.height * 0.08176615);
    path_0.arcToPoint(
      Offset(size.width * 0.05813953, 0),
      radius: Radius.elliptical(
        size.width * 0.05843023,
        size.height * 0.08217498,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.04069767, size.height * -20.26165),
      Offset(size.width * 0.7332267, size.height * 0.8280049),
      [
        Color(0xff6b778e).withOpacity(0.5),
        Color(0xff636e84).withOpacity(0.56),
        Color(0xff475061).withOpacity(0.75),
        Color(0xff222834).withOpacity(1),
      ],
      [0.3, 0.64, 0.8, 0.9],
    );
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.06308140, size.height * 0.008176615);
    path_1.lineTo(size.width * 0.9340116, size.height * 0.008176615);
    path_1.arcToPoint(
      Offset(size.width * 0.9912791, size.height * 0.08830744),
      radius: Radius.elliptical(
        size.width * 0.05726744,
        size.height * 0.08053966,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_1.lineTo(size.width * 0.9912791, size.height * 0.6627146);
    path_1.arcToPoint(
      Offset(size.width * 0.9453488, size.height * 0.7412101),
      radius: Radius.elliptical(
        size.width * 0.05697674,
        size.height * 0.08013083,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_1.lineTo(size.width * 0.07441860, size.height * 0.9852821);
    path_1.arcToPoint(
      Offset(size.width * 0.005813953, size.height * 0.9067866),
      radius: Radius.elliptical(
        size.width * 0.05726744,
        size.height * 0.08053966,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_1.lineTo(size.width * 0.005813953, size.height * 0.08830744);
    path_1.arcToPoint(
      Offset(size.width * 0.06308140, size.height * 0.008176615),
      radius: Radius.elliptical(
        size.width * 0.05726744,
        size.height * 0.08053966,
      ),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
