import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/core/routing/routes.dart';
import 'package:recipe_app_project1/home/presentation/pages/home_page_view_model.dart';
import '../../categories/data/repositories/category_repository.dart';
import '../../categories/presentation/manager/categories_view_model.dart';
import '../../categories/presentation/pages/categories_page.dart';
import '../../category_detail/data/repositories/recipe_repoitory.dart';
import '../../category_detail/presentation/manager/category_detail_view_model.dart';
import '../../category_detail/presentation/pages/category_detail_page.dart';
import '../../community/presentation/manager/community_view_model.dart';
import '../../community/presentation/pages/community_view.dart';
import '../../home/presentation/pages/home_page.dart';
import '../../login/data/repositories/auth_repository.dart';
import '../../login/presentation/manager/login_view_model.dart';
import '../../login/presentation/pages/login_page.dart';
import '../../login/presentation/pages/signup_page.dart';
import '../../onboarding/data/repositories/onboarding_repository.dart';
import '../../onboarding/presentation/manager/onboarding_view_model.dart';
import '../../onboarding/presentation/pages/onboarding_end.dart';
import '../../onboarding/presentation/pages/onboarding_page.dart';
import '../../profile/data/repositories/profile_repository.dart';
import '../../profile/data/repositories/recipes_repository.dart';
import '../../profile/presentation/pages/profile_page.dart';
import '../../profile/presentation/pages/profile_view_model.dart';
import '../../profile_register/presentation/pages/profile_register.dart';
import '../../recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import '../../recipe_detail/presentation/pages/recipe_detail_page.dart';
import '../client.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.community,
  // '/recipe-detail/1'
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) =>
            HomePageViewModel(repo: context.read(), recipeRepo: context.read()),
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: '${Routes.recipe_detail}/:recipeId',
      builder: (context, state) {
        final int recipeId = int.parse(state.pathParameters['recipeId']!);
        return ChangeNotifierProvider(
          create: (context) => RecipeDetailViewModel(
            recipeRepo: context.read(),
            recipeId: recipeId,
          ),
          child: RecipeDetailPage(recipeId: recipeId),
        );
      },
    ),
    GoRoute(
      path: Routes.category_detail,
      builder: (context, state) => CategoryDetailPage(
        vm: CategoryDetailViewModel(
          catRepo: CategoryRepository(
            client: ApiClient(),
          ),
          recipeRepo: RecipeRepository(
            client: ApiClient(),
          ),
        )..load(),
      ),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(
        vm: LoginViewModel(
          repo: AuthRepository(
            client: ApiClient(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfilePage(
        vm: ProfileViewModel(
          recipeRepo: BodyRecipesRepo(
            client: ApiClient(),
          ),
          profileRepo: ProfileRepository(
            client: ApiClient(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingPage(
        ovm: OnBoardingViewModel(
          repo: OnBoardingRepository(
            client: ApiClient(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/onboarding_end',
      builder: (context, state) => OnboardingEnd(
        pvm: ProfileViewModel(
          recipeRepo: BodyRecipesRepo(
            client: ApiClient(),
          ),
          profileRepo: ProfileRepository(
            client: ApiClient(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => CategoriesPage(
        cvm: CategoriesViewModel(
          repo: CategoryRepository(
            client: ApiClient(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.register_profile,
      builder: (context, state) => RegisterProfile(),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityTopViewModel(
          repo: context.read(),
        )..load(index: context.read<CommunityTopViewModel>().index),
        child: CommunityTopView(),
      ),
    )
  ],
);
