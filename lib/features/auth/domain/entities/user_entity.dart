import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? profileImage,
    @Default(false) bool isEmailVerified,
    @Default(false) bool drivingLicenseVerified,
    @Default(false) bool isHost,
    required DateTime createdAt,
  }) = _UserEntity;
}
