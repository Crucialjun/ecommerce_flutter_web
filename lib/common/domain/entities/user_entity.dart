// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_flutter_web/common/data/enums/app_role_enum.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';

abstract class UserEntity {
  final String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRoleEnum role;
  DateTime createdAt;
  DateTime updatedAt;
  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  static UserEntity empty() {
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
