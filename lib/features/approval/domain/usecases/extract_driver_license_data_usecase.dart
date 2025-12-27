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
    return null;
  
    // regex / rules
  }

  DateTime? _extractDateOfBirth(String text) {
    return null;
  
    // parsing logic
  }

  DateTime? _extractExpiryDate(String text) {
    return null;
  
    // parsing logic
  }

  String? _extractCountry(String text) {
    return null;
  
    // rules
  }
}
