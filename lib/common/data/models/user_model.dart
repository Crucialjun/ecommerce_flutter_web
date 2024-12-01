import 'package:ecommerce_flutter_web/common/data/enums/app_role_enum.dart';
import 'package:ecommerce_flutter_web/common/domain/entities/user_entity.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.username,
      required super.email,
      required super.phoneNumber,
      required super.profilePicture,
      required super.role,
      required super.createdAt,
      required super.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profilePicture: json['profilePicture'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'firstName': super.firstName,
      'lastName': super.lastName,
      'username': super.username,
      'email': super.email,
      'phoneNumber': super.phoneNumber,
      'profilePicture': super.profilePicture,
      'role': super.role,
      'createdAt': super.createdAt,
      'updatedAt': super.updatedAt,
    };
  }

  //from document snapshot
  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) {
      return UserModel.empty();
    }
    return UserModel(
      id: json.id,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      profilePicture: json['profilePicture'] ?? "",
      role: AppRoleEnum.fromString(json['role'] ?? ""),
      createdAt: json['createdAt'] ?? DateTime.now(),
      updatedAt: json['updatedAt'] ?? DateTime.now(),
    );
  }

  //empty user
  factory UserModel.empty() {
    return UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '',
      role: AppRoleEnum.user,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
