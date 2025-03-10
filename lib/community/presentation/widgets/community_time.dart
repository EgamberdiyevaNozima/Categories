import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';

class CommunityTime extends StatelessWidget {
  const CommunityTime({
    super.key,
    required this.time,
    this.color=AppColors.pinkSub
  });

  final num time;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/clock.svg",
          width: 10,
          height: 10,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          "$time min",
          style: TextStyle(
            color: color,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
