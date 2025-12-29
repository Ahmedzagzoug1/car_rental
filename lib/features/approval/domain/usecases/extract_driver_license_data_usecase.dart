import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/driver_license_data.dart';

class ExtractDriverLicenseDataUseCase {
  Future<Either<Failure, DriverLicenseData>> call(String rawText) async {
    try {
      final name = _extractName(rawText);
      final dob = _extractDateOfBirth(rawText);
      final expiry = _extractExpiryDate(rawText);
      final country = _extractCountry(rawText);

      if (name == null || dob == null || expiry == null || country == null) {
        return const Left(LicenseParsingFailure());
      }

      return Right(
        DriverLicenseData(
          fullName: name,
          dateOfBirth: dob,
          expirationDate: expiry,
          country: country,
        ),
      );
    } catch (_) {
      return const Left(LicenseParsingFailure());
    }
  }

  String? _extractName(String text) {


    final nameRegex = RegExp(
      r'([أ-ي]{2,}\s+[أ-ي]{2,}\s+[أ-ي]{2,}(?:\s+[أ-ي]{2,})?)',
    );

    final match = nameRegex.firstMatch(text);

        if (match != null) {
      return match.group(0);
    }


  return null;
  }

  DateTime? _extractDateOfBirth(String text) {
    // كلمات بتدل على تاريخ الميلاد
    final dobKeywords = ['تاريخ الميلاد', 'Birth', 'DOB'];

    for (final keyword in dobKeywords) {
      final regex = RegExp(
        '$keyword[^0-9]*(\\d{2}[/-]\\d{2}[/-]\\d{4})',
      );

      final match = regex.firstMatch(text);
      if (match != null) {
        return _parseDate(match.group(1)!);
      }
    }

    return null;
  }

  DateTime? _extractExpiryDate(String text) {
    // كلمات بتدل على تاريخ الانتهاء
    final expiryKeywords = [
      'صالحة حتى',
      'تاريخ الانتهاء',
      'Expiry',
      'Valid Until'
    ];

    for (final keyword in expiryKeywords) {
      final regex = RegExp(
        '$keyword[^0-9]*(\\d{2}[/-]\\d{2}[/-]\\d{4})',
      );

      final match = regex.firstMatch(text);
      if (match != null) {
        return _parseDate(match.group(1)!);
      }
    }

    return null;
  }

  String? _extractCountry(String text) {
    if (text.contains('مصر')) return 'Egypt';
    if (text.toLowerCase().contains('egypt')) return 'Egypt';

    return null;
  }
  DateTime? _parseDate(String date) {
    try {
      final parts = date.contains('/')
          ? date.split('/')
          : date.split('-');

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      return DateTime(year, month, day);
    } catch (_) {
      return null;
    }
  }
}
