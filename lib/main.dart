import 'package:flutter/material.dart';

import 'core/client.dart';
import 'core/sizes.dart';
import 'onboarding/data/repositories/onboarding_repositories.dart';
import 'onboarding/presentation/managers/onboarding_view_model.dart';
import 'onboarding/presentation/pages/onboarding_view.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      home: OnboardingView(
        vm: OnboardingViewModel(
          repo: OnboardingRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}
