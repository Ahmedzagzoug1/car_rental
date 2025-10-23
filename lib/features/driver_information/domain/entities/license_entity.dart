import 'package:equatable/equatable.dart';

class LicenseEntity extends Equatable{
  final String fullName ;
  final String country;
  final String expirationDate;
  final String dateOfBirth;
  final String licenseImageUrl;
  LicenseEntity({required this.fullName,required this.country,
  required this.dateOfBirth, required this.expirationDate,required this.licenseImageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [fullName,country,expirationDate,dateOfBirth,licenseImageUrl];
}