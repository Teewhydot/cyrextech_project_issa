import 'package:cyrextech_project_issa/components/image.dart';
import 'package:cyrextech_project_issa/components/texts.dart';
import 'package:cyrextech_project_issa/core/theme/colors.dart';
import 'package:cyrextech_project_issa/generated/assets.dart';
import 'package:flutter/material.dart';

import 'custom_container.dart';

class SkewedContainerStack extends StatefulWidget {
  final double height;
  final double width;
  final int count;
  final double spacing;

  const SkewedContainerStack({
    super.key,
    this.height = 50,
    this.width = 50,
    this.count = 5,
    this.spacing = 20,
  });

  @override
  State<SkewedContainerStack> createState() => _SkewedContainerStackState();
}

class _SkewedContainerStackState extends State<SkewedContainerStack> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final totalWidth =
        widget.count * widget.width + (widget.count - 1) * widget.spacing;
    final maxHeight = widget.height + (widget.count - 1) * 5;
    final List<CategoryItem> categories = [
      CategoryItem(name: 'All'),
      CategoryItem(name: 'Bicycle', iconPath: Assets.svgsBicycle),
      CategoryItem(name: 'Road', iconPath: Assets.svgsRoad),
      CategoryItem(name: 'Hill', iconPath: Assets.svgsHills),
      CategoryItem(name: 'Helmet', iconPath: Assets.svgsHelmet),
    ];

    return SizedBox(
      width: totalWidth,
      height: maxHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(widget.count, (index) {
          final left = index * (widget.width + widget.spacing);
          final bottom = index * 10.0;
          final isActive = index == activeIndex;
          return Positioned(
            left: left,
            bottom: bottom,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: SkewedContainer(
                width: widget.width,
                height: widget.height,
                primaryGradientColor: isActive ? kPictionBlue : kCharcoal,
                secondaryGradientColor:
                    isActive ? kMajorelleBlue : kGunMetalColor,
                primaryBgGradientColor: isActive ? kPictionBlue : kCharcoal,
                secondaryBgGradientColor:
                    isActive ? kMajorelleBlue : kGunMetalColor,
                child:
                    categories[index].iconPath != null
                        ? CustomAsset(
                          assetPath:
                              categories[index].iconPath == null
                                  ? categories[index].name
                                  : categories[index].iconPath!,
                          assetType: AssetType.svg,
                          width: 30,
                          height: 25,
                        )
                        : CustomText(
                          text: categories[index].name,
                          color: kWhite,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String? iconPath;

  CategoryItem({required this.name, this.iconPath});
}
