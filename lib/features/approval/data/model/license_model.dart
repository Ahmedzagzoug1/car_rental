import 'package:car_rental/features/approval/domain/entities/license_entity.dart';

class LicenseModel{
  final String fullName ;
  final String country;
  final String expirationDate;
  final String dateOfBirth;
  LicenseModel({required this.fullName,required this.country,
    required this.dateOfBirth, required this.expirationDate});
  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      fullName: json['full_name'] as String,
      country: json['country'] as String,
      expirationDate: json['expiration_date'] as String,
      dateOfBirth: json['date_of_birth'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'country': country,
      'expiration_date': expirationDate,
      'date_of_birth': dateOfBirth,
    };
  }
  LicenseEntity toDomain(){
    return LicenseEntity(fullName: fullName, country: country,
        dateOfBirth:dateOfBirth , expirationDate: expirationDate);
  }
}