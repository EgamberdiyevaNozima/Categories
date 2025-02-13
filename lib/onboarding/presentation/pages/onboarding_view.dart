
import 'package:flutter/material.dart';
import 'package:recipe_app_project1/onboarding/presentation/pages/welcome_pages.dart';

import '../../../core/colors.dart';

import '../../../profile/presentation/widgets/recipe_elevated_button.dart';
import '../managers/onboarding_view_model.dart';
import 'onboarding_app_bar.dart';

// Onboarding AppBar


// OnboardingView
class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.vm,
  });

  final OnboardingViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => PageView.builder(
        controller: vm.controller,
        itemCount: vm.pages.length + 1, // Add +1 for WelcomePages
        itemBuilder: (context, index) {
          // Last page will be WelcomePages
          if (index == vm.pages.length) {
            return WelcomePages(vm: vm); // Navigate to WelcomePages
          } else {
            return Scaffold(
              backgroundColor: AppColors.beigeColor,
              appBar: OnboardingAppBar(vm: vm, index: index),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    vm.pages[index].image,
                    width: double.infinity,
                    height: 741,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 286,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.beigeColor, Colors.transparent],
                          stops: [0.2, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 128,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.beigeColor, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 48,
                    child: RecipeElevatedButton(
                      text: "Continue",
                      fontSize: 20,
                      callback: () {
                        vm.controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      size: Size(207, 45),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

