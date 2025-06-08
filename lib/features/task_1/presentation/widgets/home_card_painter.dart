import 'dart:ui' as ui;

import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.05128205, size.height * 0.2512563);
    path_0.cubicTo(
      size.width * 0.05128205,
      size.height * 0.2235033,
      size.width * 0.07424179,
      size.height * 0.2010050,
      size.width * 0.1025641,
      size.height * 0.2010050,
    );
    path_0.lineTo(size.width * 0.8974359, size.height * 0.2010050);
    path_0.cubicTo(
      size.width * 0.9257590,
      size.height * 0.2010050,
      size.width * 0.9487179,
      size.height * 0.2235033,
      size.width * 0.9487179,
      size.height * 0.2512563,
    );
    path_0.lineTo(size.width * 0.9487179, size.height * 0.6586834);
    path_0.cubicTo(
      size.width * 0.9487179,
      size.height * 0.6842286,
      size.width * 0.9291590,
      size.height * 0.7057085,
      size.width * 0.9032590,
      size.height * 0.7086080,
    );
    path_0.lineTo(size.width * 0.1083869, size.height * 0.7976256);
    path_0.cubicTo(
      size.width * 0.07795615,
      size.height * 0.8010327,
      size.width * 0.05128205,
      size.height * 0.7777111,
      size.width * 0.05128205,
      size.height * 0.7476985,
    );
    path_0.lineTo(size.width * 0.05128205, size.height * 0.2512563);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.3749026, size.height * 0.3611407),
      Offset(size.width * 0.4208949, size.height * 0.7332940),
      [Color(0xff353F54).withOpacity(1), Color(0xff222834).withOpacity(1)],
      [0, 1],
    );
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1025641, size.height * 0.2035176);
    path_1.lineTo(size.width * 0.8974359, size.height * 0.2035176);
    path_1.cubicTo(
      size.width * 0.9243410,
      size.height * 0.2035176,
      size.width * 0.9461538,
      size.height * 0.2248910,
      size.width * 0.9461538,
      size.height * 0.2512563,
    );
    path_1.lineTo(size.width * 0.9461538, size.height * 0.6586809);
    path_1.cubicTo(
      size.width * 0.9461538,
      size.height * 0.6825704,
      size.width * 0.9281487,
      size.height * 0.7027186,
      size.width * 0.9041154,
      size.height * 0.7059724,
    );
    path_1.lineTo(size.width * 0.9029667, size.height * 0.7061106);
    path_1.lineTo(size.width * 0.1080954, size.height * 0.7951281);
    path_1.cubicTo(
      size.width * 0.07918615,
      size.height * 0.7983643,
      size.width * 0.05384615,
      size.height * 0.7762111,
      size.width * 0.05384615,
      size.height * 0.7476985,
    );
    path_1.lineTo(size.width * 0.05384615, size.height * 0.2512563);
    path_1.lineTo(size.width * 0.05386128, size.height * 0.2500246);
    path_1.cubicTo(
      size.width * 0.05452795,
      size.height * 0.2242284,
      size.width * 0.07607821,
      size.height * 0.2035176,
      size.width * 0.1025641,
      size.height * 0.2035176,
    );
    path_1.close();

    Paint paint_1_stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.005128205;
    paint_1_stroke.shader = ui.Gradient.linear(
      Offset(size.width * 0.1519036, size.height * 0.2235244),
      Offset(size.width * 0.4903821, size.height * 0.6972211),
      [Colors.white.withOpacity(1), Color(0xff000000).withOpacity(1)],
      [0, 1],
    );
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = kPictionBlue;
    path = Path();
    path.lineTo(size.width * 0.06, size.height * 0.42);
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.37,
      size.width * 0.08,
      size.height * 0.34,
      size.width * 0.11,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 0.11,
      size.height * 0.34,
      size.width,
      size.height * 0.34,
      size.width,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 1.03,
      size.height * 0.34,
      size.width * 1.06,
      size.height * 0.37,
      size.width * 1.06,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 1.06,
      size.height * 0.42,
      size.width * 1.06,
      size.height * 1.1,
      size.width * 1.06,
      size.height * 1.1,
    );
    path.cubicTo(
      size.width * 1.06,
      size.height * 1.15,
      size.width * 1.04,
      size.height * 1.18,
      size.width,
      size.height * 1.19,
    );
    path.cubicTo(
      size.width,
      size.height * 1.19,
      size.width * 0.12,
      size.height * 1.34,
      size.width * 0.12,
      size.height * 1.34,
    );
    path.cubicTo(
      size.width * 0.09,
      size.height * 1.34,
      size.width * 0.06,
      size.height * 1.3,
      size.width * 0.06,
      size.height * 1.25,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 1.25,
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
    );
    canvas.drawPath(path, paint);

    // Path number 2

    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.11, size.height * 0.34);
    path.cubicTo(
      size.width * 0.11,
      size.height * 0.34,
      size.width,
      size.height * 0.34,
      size.width,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 1.03,
      size.height * 0.34,
      size.width * 1.05,
      size.height * 0.38,
      size.width * 1.05,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 1.05,
      size.height * 0.42,
      size.width * 1.05,
      size.height * 1.1,
      size.width * 1.05,
      size.height * 1.1,
    );
    path.cubicTo(
      size.width * 1.05,
      size.height * 1.14,
      size.width * 1.03,
      size.height * 1.18,
      size.width,
      size.height * 1.18,
    );
    path.cubicTo(
      size.width,
      size.height * 1.18,
      size.width,
      size.height * 1.18,
      size.width,
      size.height * 1.18,
    );
    path.cubicTo(
      size.width,
      size.height * 1.18,
      size.width * 0.12,
      size.height * 1.33,
      size.width * 0.12,
      size.height * 1.33,
    );
    path.cubicTo(
      size.width * 0.09,
      size.height * 1.34,
      size.width * 0.06,
      size.height * 1.3,
      size.width * 0.06,
      size.height * 1.25,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 1.25,
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.38,
      size.width * 0.08,
      size.height * 0.34,
      size.width * 0.11,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 0.11,
      size.height * 0.34,
      size.width * 0.11,
      size.height * 0.34,
      size.width * 0.11,
      size.height * 0.34,
    );
    canvas.drawPath(path, paint);

    // Path number 3

    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.06, size.height * 0.42);
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.37,
      size.width * 0.08,
      size.height * 0.34,
      size.width * 0.11,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 0.11,
      size.height * 0.34,
      size.width,
      size.height * 0.34,
      size.width,
      size.height * 0.34,
    );
    path.cubicTo(
      size.width * 1.03,
      size.height * 0.34,
      size.width * 1.06,
      size.height * 0.37,
      size.width * 1.06,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 1.06,
      size.height * 0.42,
      size.width * 1.06,
      size.height * 1.1,
      size.width * 1.06,
      size.height * 1.1,
    );
    path.cubicTo(
      size.width * 1.06,
      size.height * 1.15,
      size.width * 1.04,
      size.height * 1.18,
      size.width,
      size.height * 1.19,
    );
    path.cubicTo(
      size.width,
      size.height * 1.19,
      size.width * 0.12,
      size.height * 1.34,
      size.width * 0.12,
      size.height * 1.34,
    );
    path.cubicTo(
      size.width * 0.09,
      size.height * 1.34,
      size.width * 0.06,
      size.height * 1.3,
      size.width * 0.06,
      size.height * 1.25,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 1.25,
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
      size.width * 0.06,
      size.height * 0.42,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the custom slanted rectangle bounds
    final rect = Rect.fromLTWH(
      size.width * -0.0071719,
      0,
      size.width * 1.0056576, // width from leftmost to rightmost point
      size.height * 1.0046229, // height from top to bottom
    );

    // Create a rounded rectangle with radius 20
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(20));

    // Create a path for the slanted rectangle
    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0071719, 0);
    path_1.lineTo(size.width * 0.9984857, size.height * 0.0045743);
    path_1.lineTo(size.width * 0.9986857, size.height * 0.8014583);
    path_1.lineTo(size.width * -0.0056467, size.height * 1.0046229);
    path_1.close();

    // Intersect the custom path with the rounded rectangle to get rounded corners
    Path roundedPath = Path.combine(
      PathOperation.intersect,
      path_1,
      Path()..addRRect(rrect),
    );

    // Fill
    Paint paint_fill_1 =
        Paint()
          ..color = const Color.fromARGB(255, 218, 56, 56)
          ..style = PaintingStyle.fill;

    canvas.drawPath(roundedPath, paint_fill_1);

    // Stroke
    Paint paint_stroke_1 =
        Paint()
          ..color = const Color.fromARGB(255, 33, 150, 243)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.01
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(roundedPath, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
