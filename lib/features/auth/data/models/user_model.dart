import 'package:car_rental/core/cache/hive/hive_type_ids.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.user)
class UserModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String? profileImage;

  @HiveField(5)
  final bool isEmailVerified;

  @HiveField(6)
  final bool drivingLicenseVerified;

  @HiveField(7)
  final bool isHost;

  @HiveField(8)
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    this.isEmailVerified = false,
    this.drivingLicenseVerified = false,
    this.isHost = false,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

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