import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.002551020, size.height * 0.9904853);
    path_0.lineTo(size.width * 0.9974490, size.height * 0.9904853);
    path_0.lineTo(size.width * 0.9974490, size.height * 0.01046622);
    path_0.lineTo(size.width * 0.002551020, size.height * 0.2435775);
    path_0.lineTo(size.width * 0.002551020, size.height * 0.9904853);
    path_0.close();

    Paint paint_0_stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.005102041;
    paint_0_stroke.shader = ui.Gradient.linear(
      Offset(0, size.height * 0.4998097),
      Offset(size.width, size.height * 0.4998097),
      [Color(0xff6d6e71).withOpacity(1), Color(0xff000000).withOpacity(1)],
      [0, 1],
    );
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5000000, size.height * 0.01008563),
      Offset(size.width * 0.5000000, size.height * 1.725690),
      [
        Color(0xff363e51).withOpacity(1),
        Color(0xff353d4f).withOpacity(1),
        Color(0xff323848).withOpacity(1),
        Color(0xff2c313d).withOpacity(1),
        Color(0xff24262c).withOpacity(1),
        Color(0xff1c1c1c).withOpacity(1),
      ],
      [0, 0.51, 0.69, 0.83, 0.93, 1],
    );
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
