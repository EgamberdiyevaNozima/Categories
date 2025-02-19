// import 'package:dio/dio.dart';
// import 'package:recipe_app_project1/auth/data/models/user_model.dart';
// import 'package:recipe_app_project1/core/secure_storage.dart';
// import 'package:dio/dio.dart';
//
// class ApiClient {
//
//   final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.0.106:8888/api/v1"));
//
//   Future<String> login(String login, String password) async {
//     var response = await dio.post(
//       '/auth/login',
//       data: {"login": login, "password": password},
//     );
//
//     if (response.statusCode == 200) {
//       var data = Map<String, String>.from(response.data);
//       return data['accessToken']!;
//     } else {
//       throw Exception("User not found");
//     }
//   }
//
//
//
//   Future<String> register(UserModel user) async {
//     var response = await dio.post(
//       '/auth/register',
//       data: {
//
//           "username": user.username,
//           "fullName": user.fullName,
//           "email": user.email,
//           "phoneNumber": user.phoneNumber,
//           "birthDate": user.birthDate,
//           "password": user.password,
//
//       },
//     );
//
//     if (response.statusCode == 200) {
//       var data = Map<String, String>.from(response.data);
//       return data['accessToken']!;
//     } else {
//       throw Exception("User not found");
//     }
//   }
//   Future<List<dynamic>> fetchOnboardingPages() async {
//     var response = await dio.get('/onboarding/list');
//     List<dynamic> data = response.data;
//     return data;
//   }
//
//   Future<dynamic> fetchTrendingRecipe() async {
//     var response = await dio.get('/recipes/trending-recipe');
//     return response.data;
//   }
//
//   Future<List<dynamic>> fetchYourRecipes(int limit) async {
//     var response = await dio.get('/recipes/my-recipes?Limit=$limit');
//     List<dynamic> data = response.data;
//     return data;
//   }
//
//   Future<List<dynamic>> fetchRecentRecipes(int limit) async {
//     return [
//       {
//         "id": 4,
//         "title": "Lemonade",
//         "description": "This is a quick overview of the ingredients for the recipe",
//         "photo": "assets/images/salami_pizza.png",
//         "timeRequired": 30,
//         "rating": 4.0,
//         "isLiked": false,
//       },
//       {
//         "id": 5,
//         "title": "Chicken Burger",
//         "description": "This is a quick overview of the ingredients for the recipe",
//         "photo": "assets/images/salami_pizza.png",
//         "timeRequired": 25,
//         "rating": 4.3,
//         "isLiked": true,
//       },
//     ];
//   }
//
//   Future<List<dynamic>> fetchCategories() async {
//     var response = await dio.get('/categories/list');
//     List<dynamic> data = response.data;
//     return data;
//   }
//
//   Future<List<dynamic>> fetchRecipes(int categoryId) async {
//     var response = await dio.get('/recipes/list?Category=$categoryId');
//     List<dynamic> data = response.data;
//     return data;
//   }
//
//   Future<dynamic> fetchRecipeById(int recipeId) async {
//     var response = await dio.get('/recipes/detail/$recipeId');
//     dynamic data = response.data;
//     return data;
//   }
//
//   Future<dynamic> fetchMyProfile() async {
//     var response = await dio.get('/auth/me');
//
//     return response.data;
//   }
//
//   Future<List<dynamic>> fetchTopChefs(int limit) async {
//     var response = await dio.get('/auth/top-chefs?Limit=$limit');
//     List<dynamic> data = response.data;
//     return data;
//   }
// }
// ---------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:recipe_app_project1/auth/data/models/user_model.dart';
import 'package:recipe_app_project1/core/secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app_project1/core/secure_storage.dart';
import 'package:flutter/material.dart';

import '../auth/data/repositories/AuthException.dart';
import '../auth/data/repositories/AuthInterceptor.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ApiClient {
  ApiClient() {
    dio.interceptors.add(AuthInterceptor());
  }
  final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.0.106:8888/api/v1"));

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 401) {
      throw AuthException(message: "Login muvaffaqiyatsiz, ma'lumotlar noto'g'ri.");
    } else if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "Login davomida xatolik yuz berdi.");
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

    if (response.statusCode == 401) {
      throw AuthException(message: "Foydalanuvchi ro'yxatdan o'tishi muvaffaqiyatsiz.");
    } else if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "Ro'yxatdan o'tishda xatolik yuz berdi.");
    }
  }

  Future<Map<String, dynamic>> fetchMyProfile() async {
    try {
      var response = await dio.get('/auth/me');

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        final credentials = await SecureStorage.getCredentials();

        if (credentials == null || credentials['login'] == null || credentials['password'] == null) {
          navigatorKey.currentContext!.go(Routes.login);
          throw Exception("Login credentials not found.");
        }
        final jwt = await login(credentials['login']!, credentials['password']!);

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

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get("/onboarding/list");
    if (response.statusCode == 401) {
      throw AuthException(message: "Onboarding sahifalariga kirishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Onboarding sahifalarini olishda xatolik.");
    }
  }

  Future<List<dynamic>> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 401) {
      throw AuthException(message: "Trenddagi retseptlarni olishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Trenddagi retseptlarni olishda xatolik.");
    }
  }


  Future<List<dynamic>> fetchYourRecipes(int limit) async {
    var response = await dio.get('/recipes/my-recipes?Limit=$limit');
    if (response.statusCode == 401) {
      throw AuthException(message: "Sizning retseptlaringizni olishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Sizning retseptlaringizni olishda xatolik.");
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 401) {
      throw AuthException(message: "Kategoriyalar ro'yxatini olishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Kategoriyalarni olishda xatolik.");
    }
  }

  Future<List<dynamic>> fetchRecipes(int categoryId) async {
    var response = await dio.get('/recipes/list?Category=$categoryId');
    if (response.statusCode == 401) {
      throw AuthException(message: "Kategoriya bo'yicha retseptlarni olishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Kategoriya bo'yicha retseptlarni olishda xatolik.");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 401) {
      throw AuthException(message: "Retseptni olishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Retseptni olishda xatolik.");
    }
  }

  Future<List<dynamic>> fetchTopChefs(int limit) async {
    var response = await dio.get('/auth/top-chefs?Limit=$limit');
    if (response.statusCode == 401) {
      throw AuthException(message: "Eng yaxshi oshpazlarni olishda ruxsat yo'q.");
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Eng yaxshi oshpazlarni olishda xatolik.");
    }
  }
}
