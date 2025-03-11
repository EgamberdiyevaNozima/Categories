<<<<<<< HEAD


import '../../../core/client.dart';
import '../models/profile_model.dart';
=======
import 'package:profile/core/client.dart';
import 'package:profile/profile/data/models/profile_model.dart';
>>>>>>> origin/main

class ProfileRepository {
  ProfileRepository({required this.client});

  final ApiClient client;

  ProfileModel? myProfile;

<<<<<<< HEAD
  Future<ProfileModel?> fetchMyProfile() async {
    if (myProfile != null) return myProfile;

    var rawProfile = await client.fetchMyProfile();
    myProfile = ProfileModel.fromJson(rawProfile!);
    return myProfile;
=======
  Future<ProfileModel> fetchMyProfile() async {
    // if (myProfile != null) return myProfile!;


    var rawProfile = await client.fetchMyProfile();
    myProfile = ProfileModel.fromJson(rawProfile);
    return myProfile!;
>>>>>>> origin/main
  }
}
