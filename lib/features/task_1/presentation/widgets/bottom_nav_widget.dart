import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/image.dart';
import '../../../../generated/assets.dart';
import 'custom_container.dart';
import 'custom_nav_bg.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: RPSCustomPainter(),
          child: SizedBox(width: 1.sw, height: 103.h),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child:
                      selectedIndex == 0
                          ? SkewedContainer(
                            key: const ValueKey('selected_0'),
                            width: 70,
                            height: 60,
                            skew: true,
                            child: CustomAsset(
                              assetPath: Assets.svgsBicycle,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          )
                          : SizedBox(
                            width: 60,
                            height: 60,
                            child: CustomAsset(
                              key: const ValueKey('unselected_0'),
                              assetPath: Assets.svgsBicycle,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          ),
                ),
                onPressed: () {
                  // Handle home button press
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child:
                      selectedIndex == 1
                          ? SkewedContainer(
                            key: const ValueKey('selected_1'),
                            width: 60,
                            height: 60,
                            skew: true,
                            child: CustomAsset(
                              assetPath: Assets.navSvgsWalls,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          )
                          : SizedBox(
                            width: 60,
                            height: 60,
                            child: CustomAsset(
                              key: const ValueKey('unselected_1'),
                              assetPath: Assets.navSvgsWalls,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          ),
                ),
                onPressed: () {
                  // Handle favorite button press
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child:
                      selectedIndex == 2
                          ? SkewedContainer(
                            key: const ValueKey('selected_2'),
                            width: 60,
                            height: 60,
                            skew: true,
                            child: CustomAsset(
                              assetPath: Assets.navSvgsCart,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          )
                          : SizedBox(
                            width: 60,
                            height: 60,

                            child: CustomAsset(
                              key: const ValueKey('unselected_2'),
                              assetPath: Assets.navSvgsCart,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          ),
                ),
                onPressed: () {
                  // Handle favorite button press
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child:
                      selectedIndex == 3
                          ? SkewedContainer(
                            key: const ValueKey('selected_3'),
                            width: 60,
                            height: 60,
                            skew: true,
                            child: CustomAsset(
                              assetPath: Assets.navSvgsPerson,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          )
                          : SizedBox(
                            width: 60,
                            height: 60,
                            child: CustomAsset(
                              key: const ValueKey('unselected_3'),
                              assetPath: Assets.navSvgsPerson,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          ),
                ),
                onPressed: () {
                  // Handle profile button press
                  setState(() {
                    selectedIndex = 3;
                  });
                },
              ),
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child:
                      selectedIndex == 4
                          ? SkewedContainer(
                            key: const ValueKey('selected_4'),
                            width: 60,
                            height: 60,
                            skew: true,
                            child: CustomAsset(
                              assetPath: Assets.navSvgsDoc,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          )
                          : SizedBox(
                            width: 60,
                            height: 60,
                            child: CustomAsset(
                              key: const ValueKey('unselected_4'),
                              assetPath: Assets.navSvgsDoc,
                              assetType: AssetType.svg,
                              width: 28,
                              height: 28,
                            ),
                          ),
                ),
                onPressed: () {
                  // Handle profile button press
                  setState(() {
                    selectedIndex = 4;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
