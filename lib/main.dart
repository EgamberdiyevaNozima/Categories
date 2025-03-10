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
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              MyLocalizations.delegate,
            ],
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
