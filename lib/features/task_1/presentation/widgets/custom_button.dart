import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../../../../core/theme/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  void _handleTapDown(_) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(_) {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  void didUpdateWidget(covariant CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset pressed state if active state changes
    if (oldWidget.isActive != widget.isActive && !widget.isActive) {
      _isPressed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isActive;
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: (details) {
        _handleTapUp(details);
        if (widget.onTap != null) widget.onTap!();
      },
      onTapCancel: _handleTapCancel,
      child: NeumorphicButton(
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        minDistance: -3,
        onPressed: widget.onTap,
        style: NeumorphicStyle(
          color: kCharcoal,
          depth: isActive || _isPressed ? -3 : 3,
          intensity: 3,
          lightSource: LightSource.topLeft,
          shadowDarkColor: kGunMetalColor,
          shadowLightColor: Color(0xff38445A),
          surfaceIntensity: 2,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.r)),
          shadowLightColorEmboss: Color(0xff38445A),
          shadowDarkColorEmboss: kGunMetalColor,
        ),
        child: CustomText(
          text: widget.text,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: isActive ? kPictionBlue : kWhite,
        ),
      ),
    );
  }
}
