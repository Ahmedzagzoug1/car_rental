// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get drivingLicenseVerified => throw _privateConstructorUsedError;
  bool get isHost => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? phone,
      String? profileImage,
      bool isEmailVerified,
      bool drivingLicenseVerified,
      bool isHost,
      DateTime createdAt});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? profileImage = freezed,
    Object? isEmailVerified = null,
    Object? drivingLicenseVerified = null,
    Object? isHost = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      drivingLicenseVerified: null == drivingLicenseVerified
          ? _value.drivingLicenseVerified
          : drivingLicenseVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? phone,
      String? profileImage,
      bool isEmailVerified,
      bool drivingLicenseVerified,
      bool isHost,
      DateTime createdAt});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? profileImage = freezed,
    Object? isEmailVerified = null,
    Object? drivingLicenseVerified = null,
    Object? isHost = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      drivingLicenseVerified: null == drivingLicenseVerified
          ? _value.drivingLicenseVerified
          : drivingLicenseVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.phone,
      this.profileImage,
      this.isEmailVerified = false,
      this.drivingLicenseVerified = false,
      this.isHost = false,
      required this.createdAt});

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? profileImage;
  @override
  @JsonKey()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final bool drivingLicenseVerified;
  @override
  @JsonKey()
  final bool isHost;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, phone: $phone, profileImage: $profileImage, isEmailVerified: $isEmailVerified, drivingLicenseVerified: $drivingLicenseVerified, isHost: $isHost, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.drivingLicenseVerified, drivingLicenseVerified) ||
                other.drivingLicenseVerified == drivingLicenseVerified) &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone,
      profileImage, isEmailVerified, drivingLicenseVerified, isHost, createdAt);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {required final String id,
      required final String name,
      required final String email,
      final String? phone,
      final String? profileImage,
      final bool isEmailVerified,
      final bool drivingLicenseVerified,
      final bool isHost,
      required final DateTime createdAt}) = _$UserEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get profileImage;
  @override
  bool get isEmailVerified;
  @override
  bool get drivingLicenseVerified;
  @override
  bool get isHost;
  @override
  DateTime get createdAt;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
