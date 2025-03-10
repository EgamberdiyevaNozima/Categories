import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app_project1/categories/data/repositories/category_repository.dart';
import 'package:recipe_app_project1/community/data/repositories/community_repository.dart';
import 'package:recipe_app_project1/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app_project1/community/presentation/pages/community_view.dart';

import '../category_detail/data/repositories/recipe_repoitory.dart';
import '../login/data/repositories/auth_repository.dart';
import '../login/presentation/manager/sign_up_viewmodel.dart';
import '../onboarding/data/repositories/onboarding_repository.dart';
import '../onboarding/presentation/manager/onboarding_view_model.dart';
import 'client.dart';
import 'localization_viewmodel.dart';

List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => AuthRepository(
      client: context.read(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => SignUpViewModel(
      authRepo: AuthRepository(
        client: context.read(),
      ),
    ),
  ),
  Provider(
    create: (context) => OnBoardingViewModel(
      repo: OnBoardingRepository(
        client: context.read(),
      ),
    ),
  ),
  ListenableProvider(
    create: (context) => CommunityTopViewModel(
      repo: RecipeRepository(
        client: context.read(),
      ),
    ),
  ),
  Provider(
    create: (context) => RecipeRepository(
      client: context.read(),
    ),
  ),
  ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  )
];
