
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
  Provider(
    create: (context) => RecipeRepository(
      client: context.read(),
    ),
  ),
  ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
];
