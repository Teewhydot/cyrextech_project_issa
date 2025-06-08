import 'package:flutter/cupertino.dart';

extension Tappable on Widget {
  Widget onTap(VoidCallback? onTap, {Key? key}) {
    return GestureDetector(key: key, onTap: onTap, child: this);
  }

  Widget onLongPress(VoidCallback? onLongPress, {Key? key}) {
    return GestureDetector(key: key, onLongPress: onLongPress, child: this);
  }
}
