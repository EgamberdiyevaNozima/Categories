import 'package:dio/dio.dart';
<<<<<<< HEAD
import 'package:go_router/go_router.dart';
import 'package:recipe_app_project1/core/routing/routes.dart';
import 'package:recipe_app_project1/core/secure_storage.dart';

import '../community/data/models/community_model.dart';
import '../login/data/model/user_model.dart';
import '../main.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.3.227:8888/api/v1"));

  Future<Map<String, dynamic>> fetchMyProfile() async {
    try {
      var response = await dio.get('/auth/me');

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        final credentials = await SecureStorage.getCredentials();

        if (credentials == null ||
            credentials['login'] == null ||
            credentials['password'] == null) {
          navigatorKey.currentContext!.go(Routes.login);
          throw Exception("Login credentials not found.");
        }
        final jwt =
        await login(credentials['login']!, credentials['password']!);

        await SecureStorage.deleteToken();
        await SecureStorage.saveToken(jwt);

        var newResponse = await dio.get('/auth/me');
        if (newResponse.statusCode == 200) {
          return newResponse.data;
        } else {
          navigatorKey.currentContext!.go(Routes.login);
          throw Exception("User is not authorized.");
        }
      } else {
        throw Exception("Profilni olishda xatolik yuz berdi.");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<List<dynamic>> fetchOnBoarding() async {
    var response = await dio.get('/onboarding/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("xato");
    }
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    var responseRecipe = await dio.get('/recipes/list');
    if (responseRecipe.statusCode == 200) {
      List<Map<String, dynamic>> dataRecipe =
      List<Map<String, dynamic>>.from(responseRecipe.data);
      return dataRecipe;
    } else {
      throw Exception("error 404");
    }
  }

  Future<dynamic> fetchRecipeTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Error");
    }
  }


  Future<List<Map<String, dynamic>>> fetchCategories() async {
    var responseCategories = await dio.get('/categories/list');

    if (responseCategories.statusCode == 200) {
      List<Map<String, dynamic>> dataCategories =
      List<Map<String, dynamic>>.from(responseCategories.data);
      return dataCategories;
    } else {
      throw Exception("Error");
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio
        .post('/auth/login', data: {'login': login, 'password': password});
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("BIRODAR XATOLIK BOR ORTGA QAYT");
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      // data: model.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchRecipesByCategory(int categoryId) async {
    var response = await dio.get('/recipes/list?Category=$categoryId');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception(
          "/recipes/list?Category=$categoryId so'rovimiz o'xshamadi");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('/recipes/list?Category=$recipeId ERROR STATUS CODE');
    }
  }

  Future<List< dynamic>> fetchYourRecipes() async {
    var response  = await dio.get('/recipes/list?Limit=2');

    if (response.statusCode == 200) {
      List< dynamic> data =response.data;
      return data;
    } else {
      throw Exception("/recipes/list?Limit=2 sorovi xato ketayabdi");
    }
  }

  Future<List< dynamic>> fetchCommunity() async {
    var response  = await dio.get('/recipes/list?Limit=2');

    if (response.statusCode == 200) {
      List< dynamic> data =response.data;
      return data;
    } else {
      throw Exception("/recipes/list?Limit=2 sorovi xato ketayabdi");
    }
  }

  // Future<List<dynamic>> fetchCommunityRecipes(
  //     int? limit, {
  //       required String order,
  //       bool descending = true,
  //     }) async {
  //   var response = await dio.get(
  //       "/recipes/community/list?Limit=${limit ?? ""}&Order=$order&Descending=$descending");
  //   List<dynamic> data = response.data;
  //   return data;
  // }
  Future<List<dynamic>> fetchCommunityRecipes(
      int? limit, {
        required String order,
        bool descending = true,
      }) async {
    var response = await dio.get(
        "/recipes/community/list?Limit=${limit ?? ""}&Order=$order&Descending=$descending");
=======
import '../auth/data/models/user_model.dart';

class ApiClient {

  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.3.191:8888/api/v1"));

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
>>>>>>> origin/main
    List<dynamic> data = response.data;
    return data;
  }
}
<<<<<<< HEAD
=======



>>>>>>> origin/main
