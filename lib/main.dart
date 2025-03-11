<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/category_detail/data/repositories/recipe_repoitory.dart';
import 'package:recipe_app_project1/community/data/models/community_model.dart';
import 'package:recipe_app_project1/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app_project1/community/presentation/pages/community_view.dart';
import 'package:recipe_app_project1/home/presentation/pages/home_page_view_model.dart';
import 'core/client.dart';
import 'core/dependencies.dart' show providers;
import 'core/l10n/app_localizations.dart';
import 'core/localization_viewmodel.dart';
import 'core/preferences.dart';
import 'core/routing/router.dart';
import 'core/sizes.dart';
import 'core/utils/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

//
void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // Flutter xizmatlarini boshlash
  // Preferences.init().then((_) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return ScreenUtilInit(
        designSize: Size(430, 932),
        child: MultiProvider(
          providers: providers,
          builder: (context, child) => MaterialApp.router(
            theme: AppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
=======
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
import 'package:provider/provider.dart';
import 'auth/data/repositories/AuthRepository.dart';
import 'auth/presentation/manager/login_view_model.dart';
import 'auth/presentation/pages/login_view.dart';
import 'categories/data/repositories/categories_repository.dart';
import 'categories/presentation/pages/categories_view.dart';
import 'categories/presentation/pages/categories_view_model.dart';
import 'categories_detail/data/repositories/categories_detail_repository.dart';
import 'categories_detail/presentation/pages/categories_detail_view.dart';
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
>>>>>>> origin/main
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              MyLocalizations.delegate,
            ],
<<<<<<< HEAD
            supportedLocales: [
              Locale("uz"),
              Locale("en"),
            ],
            locale: context.watch<LocalizationViewModel>().currentLocale,
            // home: CommunityTopView(
            //   vm: CommunityTopViewModel(
            //     repo: RecipeRepository(
            //       client: ApiClient(),
            //     ),
            //   ),
            // )
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'core/dependencies.dart';
// import 'core/localization_viewmodel.dart';
// import 'core/routing/router.dart';
// import 'core/utils/theme.dart';
//
//
//
// final navigatorKey=GlobalKey<NavigatorState>();
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   runApp(RecipeApp());
// }
//
// class RecipeApp extends StatelessWidget {
//   const RecipeApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: providers,
//       builder: (context, child) => ScreenUtilInit(
//         designSize: Size(430, 932),
//         child: MaterialApp.router(
//           theme: darkTheme,
//           debugShowCheckedModeBanner: false,
//           routerConfig: router,
//           localizationsDelegates: [
//             GlobalMaterialLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             // AppLocalizations.delegate
//           ],
//           supportedLocales: [
//             Locale("uz"),
//             Locale("en"),
//           ],
//           locale: context.watch<LocalizationViewModel>().currentLocale,
//         ),
//       ),
//     );
//   }
// }
=======
            supportedLocales: [Locale("uz"), Locale("en"), Locale("ru")],
            locale: context.watch<LocalizationViewModel>().currentLocale,
            home: LoginView(
              vm: LoginViewModel(
                  repo: AuthRepository(client: ApiClient())
                // catsRepo: CategoriesRepository(
                //   client: ApiClient(),
                // ),
                // selected: CategoryModel(
                //   id: 3,
                //   title: '',
                //   image: '',
                //   main: true,
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}
>>>>>>> origin/main
