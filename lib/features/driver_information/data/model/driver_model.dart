import 'package:car_rental/features/driver_information/data/model/license_model.dart';

class DriverModel{
  final String name;
  final String mobileNumber;
  final String imageUrl;
  final LicenseModel licenseModel;
  DriverModel({required this.name,required this.mobileNumber ,required this.imageUrl,required this.licenseModel});
  /// A factory constructor to create a [DriverModel] from a JSON map.
  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      name: json['name'] as String,
      mobileNumber: json['mobileNumber'] as String,
      imageUrl: json['imageUrl'] as String,
      // Handle the nested LicenseModel by calling its fromJson method.
      licenseModel: LicenseModel.fromJson(json['licenseModel'] as Map<String, dynamic>),
    );
  }

  /// A method to convert a [DriverModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'imageUrl': imageUrl,
      // Handle the nested LicenseModel by calling its toJson method.
      'licenseModel': licenseModel.toJson(),
    };
  }


}