import 'package:flutter/material.dart';
import 'package:profile/auth/presentation/manager/login_view_model.dart';
import 'package:profile/auth/presentation/pages/login_view.dart';
import 'package:profile/core/client.dart';
import 'package:profile/core/colors.dart';
import 'package:profile/core/sizes.dart';

import 'auth/data/repositories/AuthRepository.dart';


void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.redPinkMain,
          surface: AppColors.beigeColor,
          onSurface: Colors.white,
        ),
      ),
      home: LoginView(
        vm: LoginViewModel(
          repo: AuthRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}


