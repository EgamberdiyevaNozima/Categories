

import 'package:recipe_app_project1/community/data/models/user_model.dart';

import '../../../login/data/model/user_model.dart';

class CommunityModel {
  final num  timeRequired, rating, reviewsCount;
  final int id;
  final String title, description, photo, created;

  final CommunityUserModel user;

  CommunityModel(
      {required this.id,
        required this.timeRequired,
        required this.rating,
        required this.reviewsCount,
        required this.title,
        required this.description,
        required this.photo,
        required this.created,
        required this.user});

  // factory CommunityModel.fromJson(Map<String, dynamic> json) {
  //   return CommunityModel(
  //     id: json["id"],
  //     timeRequired: json["timeRequired"],
  //     rating: json["rating"],
  //     reviewsCount: json["reviewsCount"],
  //     title: json["title"],
  //     description: json["description"],
  //     photo: json["photo"],
  //     created: json["created"],
  //     user: CommunityUserModel.fromJson(json["user"]),
  //   );
  // }
  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json["id"] ?? 0,
      timeRequired: json["timeRequired"] ?? 0,
      rating: json["rating"] ?? 0.0,
      reviewsCount: json["reviewsCount"] ?? 0,
      title: json["title"] ?? '',
      description: json["description"] ?? '',
      photo: json["photo"] ?? '',
      created: json["created"] ?? '',
      user: json["user"] != null
          ? CommunityUserModel.fromJson(json["user"])
          : CommunityUserModel(
          id: 1,
          profilePhoto: '',
          username: '',
          firstName: '',
          lastName: ''
      ), // NULL bo‘lsa, default qiymatlar bilan user yaratamiz
    );
  }

}

