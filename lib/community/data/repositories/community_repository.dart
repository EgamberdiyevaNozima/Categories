//
// import '../../../core/client.dart';
// import '../models/community_model.dart';
//
// class CommunityRepository {
//   CommunityRepository({required this.client});
//
//   final ApiClient client;
//
//   List<CommunityModel> pages = [];
//
//   factory CommunityRepository.fromJson(Map<String, dynamic> json) {
//     return CommunityRepository(
//       client: ApiClient(),
//     );
//   }
//
//   Future<List<CommunityModel>> fetchCommunityRecipes(
//       int? limit, {
//         required String order,
//         bool descending = true,
//       }) async {
//     var communitiesData = await client.fetchCommunityRecipes(limit,
//         order: order, descending: descending);
//     pages = communitiesData.map((e) => CommunityModel.fromJson(e)).toList();
//     return pages;
//   }
//
// }
