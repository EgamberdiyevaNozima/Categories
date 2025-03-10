// class CommunityUserModel{
//   final int id;
//   final String profilePhoto,username,firsName,lastName;
//
//   CommunityUserModel({
//     required this.id,
//     required this.profilePhoto,
//     required this.username,
//     required this.firsName,
//     required this.lastName,
//   });
//   factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
//     return CommunityUserModel(
//       id: json['id'],
//       profilePhoto:json['profilePhoto'],
//       username:json['username'],
//       firsName:json["firsName"],
//       lastName: json['lastName'],
//     );
//   }
// }



class CommunityUserModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  CommunityUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
    return CommunityUserModel(
      id: json["id"] ?? 1, // null bo‘lsa, 0 qo‘yamiz
      profilePhoto: json["profilePhoto"] ?? '', // null bo‘lsa, bo‘sh string
      username: json["username"] ?? '', // null bo‘lsa, bo‘sh string
      firstName: json["firstName"] ?? '', // null bo‘lsa, bo‘sh string
      lastName: json["lastName"] ?? '', // null bo‘lsa, bo‘sh string
    );
  }
}
