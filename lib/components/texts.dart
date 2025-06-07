import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color, decorationColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final MainAxisAlignment alignment;
  final List<TextDecoration> decorations;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.decorationColor = kWhite,
    this.fontWeight = FontWeight.bold,
    this.alignment = MainAxisAlignment.center,
    this.decorations = const [],
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: fontSize.sp,
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: TextDecoration.combine([...decorations]),
            decorationColor: decorationColor,
          ),
        ),
      ],
    );
  }
}

class CustomWrapText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;
  const CustomWrapText({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.color = kWhite,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center, // Adjust alignment as needed
      child: Wrap(
        alignment: WrapAlignment.center, // Aligns the text within the Wrap
        children: [
          Text(
            text,
            textAlign: textAlign, // Ensures text is centered
            overflow: textOverflow,
            style: TextStyle(
              fontFamily: "ProximaNova",
              fontSize: fontSize.sp,
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
