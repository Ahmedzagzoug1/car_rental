// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      profileImage: json['profileImage'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      drivingLicenseVerified: json['drivingLicenseVerified'] as bool? ?? false,
      isHost: json['isHost'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'profileImage': instance.profileImage,
      'isEmailVerified': instance.isEmailVerified,
      'drivingLicenseVerified': instance.drivingLicenseVerified,
      'isHost': instance.isHost,
      'createdAt': instance.createdAt.toIso8601String(),
    };
