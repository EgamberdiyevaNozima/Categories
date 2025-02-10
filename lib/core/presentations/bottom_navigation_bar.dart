import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../sizes.dart';
import '../utils.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 281 * AppSizes.wRatio,
      height: 56 * AppSizes.hRatio,
      decoration: BoxDecoration(
        color: AppColors.nameColor,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/icons/home.svg'),
          SvgPicture.asset('assets/icons/community.svg'),
          SvgPicture.asset('assets/icons/category_item.svg'),
          SvgPicture.asset('assets/icons/profile.svg'),
        ],
      ),
    );
  }
}
