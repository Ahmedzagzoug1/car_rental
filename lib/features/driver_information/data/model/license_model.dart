class LicenseModel{
  final String fullName ;
  final String country;
  final String expirationDate;
  final String dateOfBirth;
  final String licenseImageUrl;
  LicenseModel({required this.fullName,required this.country,
    required this.dateOfBirth, required this.expirationDate,required this.licenseImageUrl});
  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      fullName: json['fullName'] as String,
      country: json['country'] as String,
      expirationDate: json['expirationDate'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      licenseImageUrl: json['licenseImageUrl'] as String,
    );
  }

  /// A method to convert a [LicenseModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'country': country,
      'expirationDate': expirationDate,
      'dateOfBirth': dateOfBirth,
      'licenseImageUrl': licenseImageUrl,
    };
  }
}