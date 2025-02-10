
import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../pages/chef_staff_view_model.dart';

class ChefStaffTitle extends StatelessWidget {
  const ChefStaffTitle({
    super.key,
    required this.vm,
  });

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          vm.model!.fullName,
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "@${vm.model!.username}",
          style: TextStyle(
            color: AppColors.nameColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          vm.model!.bio,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
