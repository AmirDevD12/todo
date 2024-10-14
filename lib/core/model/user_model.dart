// import 'package:alvand/core/entity/user_entity.dart';
// import 'package:alvand/core/model/file_model.dart';
// class UserModel extends UserEntity {
//   UserModel({
//     super.id,
//     super.firstName,
//     super.lastName,
//     super.phoneNumber,
//     super.picture,
//     super.gender,
//     super.age,
//     super.address,
//     super.education,
//     super.job,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         phoneNumber: json["phone_number"],
//         picture: json["picture"] != null ? FileModel.fromJson(json["picture"]) : null,
//         gender: json["gender"],
//         age: json["age"],
//         address: json["address"],
//         education: json["education"],
//         job: json["job"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "phone_number": phoneNumber,
//         "picture": picture,
//         "gender": gender,
//         "age": age,
//         "address": address,
//         "education": education,
//         "job": job,
//       };
// }