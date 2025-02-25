// import 'package:flutter/material.dart';
// import 'package:profile/auth/presentation/manager/login_view_model.dart';
// import 'package:profile/auth/presentation/pages/login_view.dart';
// import 'package:profile/core/client.dart';
// import 'package:profile/core/colors.dart';
// import 'package:profile/core/sizes.dart';
//
// import 'auth/data/repositories/AuthRepository.dart';
//
//
// void main() {
//   runApp(ProfileApp());
// }
//
// class LocalizationViewModel extends ChangeNotifier {
//   Locale _currentLocale = Locale("en");
//
//   Locale get currentLocale => _currentLocale;
//
//   set currentLocale(Locale locale) {
//     _currentLocale = locale;
//   }
// }
//
//
// class ProfileApp extends StatelessWidget {
//   const ProfileApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     AppSizes.init(context);
//     return MaterialApp(
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData(
//         fontFamily: "Poppins",
//         appBarTheme: AppBarTheme(
//           titleTextStyle: TextStyle(
//             color: AppColors.redPinkMain,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: AppColors.redPinkMain,
//           surface: Colors.black54,
//           onSurface: AppColors.beigeColor,
//           tertiary: Colors.black,
//           error: AppColors.redPinkMain,
//           secondary: Colors.pink,
//         ),
//       ),
//       home: LoginView(
//         vm: LoginViewModel(
//           repo: AuthRepository(
//             client: ApiClient(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:profile/categories_detail/data/repositories/categories_detail_repository.dart';
import 'package:profile/categories_detail/presentation/pages/categories_detail_view.dart';
import 'package:provider/provider.dart';
import 'auth/data/repositories/AuthRepository.dart';
import 'auth/presentation/manager/login_view_model.dart';
import 'auth/presentation/pages/login_view.dart';
import 'categories/data/repositories/categories_repository.dart';
import 'categories/presentation/pages/categories_view.dart';
import 'categories/presentation/pages/categories_view_model.dart';
import 'categories_detail/presentation/pages/categories_detail_view_model.dart';
import 'core/client.dart';
import 'core/colors.dart';
import 'core/l10n/app_localizations.dart';
import 'core/sizes.dart';
import 'onboarding/data/repositories/onboarding_repositories.dart';
import 'onboarding/presentation/managers/onboarding_view_model.dart';
import 'onboarding/presentation/pages/onboarding_view.dart';

void main() {
  runApp(ProfileApp());
}

class LocalizationViewModel extends ChangeNotifier {
  Locale _currentLocale = Locale("en");
  Locale get currentLocale => _currentLocale;

  set currentLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}

class ProfileApp extends StatelessWidget {
  ProfileApp({super.key});

  final darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.redPinkMain,
      onPrimary: Colors.white,
      secondary: AppColors.pink,
      onSecondary: AppColors.pinkSub,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.beigeColor,
      onSurface: AppColors.redPinkMain,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
      ],
      child: Builder(
        builder: (context) {
          AppSizes.init(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: darkTheme,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              MyLocalizations.delegate,
            ],
            supportedLocales: [Locale("uz"), Locale("en"), Locale("ru")],
            locale: context.watch<LocalizationViewModel>().currentLocale,
            home: CategoriesDetailView(
              viewModel: CategoriesDetailViewModel(
                repo: CategoriesDetailRepository(client: ApiClient()),
              ),
            ),
          );
        },
      ),
    );
  }
}
