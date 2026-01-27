import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? profileImage,
    @Default(false) bool isEmailVerified,
    @Default(false) bool drivingLicenseVerified,
    @Default(false) bool isHost,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      profileImage: entity.profileImage,
      isEmailVerified: entity.isEmailVerified,
      drivingLicenseVerified: entity.drivingLicenseVerified,
      isHost: entity.isHost,
      createdAt: entity.createdAt,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      profileImage: profileImage,
      isEmailVerified: isEmailVerified,
      drivingLicenseVerified: drivingLicenseVerified,
      isHost: isHost,
      createdAt: createdAt,
    );
  }
}
