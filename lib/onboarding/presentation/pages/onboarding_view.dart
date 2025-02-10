
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/sizes.dart';
import '../../../core/utils.dart';
import '../manager/onboarding_page_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.vm});

  final OnboardingViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder:(context, child) => Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainBackgroundColor,
          leading: Center(
              child: SvgPicture.asset(
                'assets/icons/back-arrow.svg',
                height: 20 * AppSizes.hRatio,
                width: 30 * AppSizes.wRatio,
                fit: BoxFit.cover,
              )),
        ),
        body: PageView.builder(
          itemCount: vm.pages.length,
          itemBuilder: (context, index) {
            Image.network(vm.pages[index].image);
          },
        ),
      )
    );
  }
}
