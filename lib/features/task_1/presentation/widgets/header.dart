import 'package:flutter/material.dart';

import '../../../../components/image.dart';
import '../../../../components/texts.dart';
import '../../../../core/theme/colors.dart';
import '../../../../generated/assets.dart';
import 'custom_container.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Choose your Bike",
          fontSize: 20,
          color: kWhite,
          fontWeight: FontWeight.w700,
        ),
        SkewedContainer(
          width: 44,
          height: 44,
          child: CustomAsset(
            assetPath: Assets.svgsSearch,
            assetType: AssetType.svg,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
