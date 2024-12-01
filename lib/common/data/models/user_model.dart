import 'package:ecommerce_flutter_web/common/domain/entities/user_entity.dart';

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
}
