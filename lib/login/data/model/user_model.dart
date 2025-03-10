//
// class UserModel {
//   final int id;
//   final String username, surname, name, profilePhoto;
//
//   UserModel({
//     required this.id,
//     required this.username,
//     required this.surname,
//     required this.name,
//     required this.profilePhoto,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json["id"],
//       username: json["username"],
//       surname: json["lastName"],
//       name: json["firstName"],
//       profilePhoto: json["profilePhoto"],
//     );
//   }
// }
class UserModel {
  final firstName, lastName, username, email, phoneNumber, password;
  DateTime dateOfBirth;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.dateOfBirth,
  });
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "fullName": "$firstName $lastName",
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "birthDate": "${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}",
    };
  }
}
