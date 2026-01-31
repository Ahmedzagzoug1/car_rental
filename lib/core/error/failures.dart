import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String? message]) : super(message ?? 'Server Error, please try again later');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Cache Error');
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super('Please check your internet connection');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('The requested resource was not found');
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure([String? message]) : super(message ?? 'Invalid input provided');
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure() : super('No data found in cache');
}

class AuthFailure extends Failure {
  const AuthFailure([String? message]) : super(message ?? 'Authentication failed');
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure() : super('This email is already registered');
}

class ImageNotSelectedFailure extends Failure {
  const ImageNotSelectedFailure() : super('No image was selected');
}

class OcrProcessingFailure extends Failure {
  const OcrProcessingFailure() : super('Failed to process image data');
}

class LicenseParsingFailure extends Failure {
  const LicenseParsingFailure() : super('Could not extract license data clearly');
}

class MissingLicenseFieldsFailure extends Failure {
  const MissingLicenseFieldsFailure(String field) : super('Missing $field in license');
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure() : super('The password provided is too weak');
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure() : super('The email address is badly formatted');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Unauthorized access, please login again');
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure() : super('No user found with this credentials');
}

class ImageUploadFailure extends Failure {
  const ImageUploadFailure() : super('Failed to upload image to server');
}

class InternalFailure extends Failure {
  const InternalFailure([String? message]) : super(message ?? 'An internal error occurred');
}