class Routes {
  static const login = '/login';
  static const signup = "/signup";
  static const categories = '/categories';
  static const onboarding = "/onboarding";
  static const register_profile = '/register-profile';
  // static const recipeDetails = '/recipe-details';
  static const category_detail = '/category-detail';
  static const recipe_detail = '/recipe-detail';
  static const home = '/home';
  static String recipeBuilder(int id, [String? title]) => "/recipe/$id";
  static const homePage = "/";

  static const meProfile="/me-profile";
  static String chefProfileBuilder(int id)=>"/user/$id";
  static const community= "/community";

}
