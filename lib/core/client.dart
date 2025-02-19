import 'package:dio/dio.dart';
import 'package:recipe_app_project1/auth/data/models/user_model.dart';
import 'package:recipe_app_project1/core/secure_storage.dart';
import 'package:dio/dio.dart';

class ApiClient {

  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.3.108:8888/api/v1"));

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("User not found");
    }
  }



  Future<String> register(UserModel user) async {
    var response = await dio.post(
      '/auth/register',
      data: {

          "username": user.username,
          "fullName": user.fullName,
          "email": user.email,
          "phoneNumber": user.phoneNumber,
          "birthDate": user.birthDate,
          "password": user.password,

      },
    );

    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("User not found");
    }
  }
  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get('/onboarding/list');
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    return response.data;
  }

  Future<List<dynamic>> fetchYourRecipes(int limit) async {
    var response = await dio.get('/recipes/my-recipes?Limit=$limit');
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecentRecipes(int limit) async {
    return [
      {
        "id": 4,
        "title": "Lemonade",
        "description": "This is a quick overview of the ingredients for the recipe",
        "photo": "assets/images/salami_pizza.png",
        "timeRequired": 30,
        "rating": 4.0,
        "isLiked": false,
      },
      {
        "id": 5,
        "title": "Chicken Burger",
        "description": "This is a quick overview of the ingredients for the recipe",
        "photo": "assets/images/salami_pizza.png",
        "timeRequired": 25,
        "rating": 4.3,
        "isLiked": true,
      },
    ];
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipes(int categoryId) async {
    var response = await dio.get('/recipes/list?Category=$categoryId');
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    dynamic data = response.data;
    return data;
  }

  Future<dynamic> fetchMyProfile() async {
    var response = await dio.get('/auth/me');

    return response.data;
  }

  Future<List<dynamic>> fetchTopChefs(int limit) async {
    var response = await dio.get('/auth/top-chefs?Limit=$limit');
    List<dynamic> data = response.data;
    return data;
  }
}





