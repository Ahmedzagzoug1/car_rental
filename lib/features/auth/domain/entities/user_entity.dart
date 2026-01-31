import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final bool isEmailVerified;
  final bool drivingLicenseVerified;
  final bool isHost;
  final DateTime createdAt;

  const UserEntity({
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

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    profileImage,
    isEmailVerified,
    drivingLicenseVerified,
    isHost,
    createdAt,
  ];
}



