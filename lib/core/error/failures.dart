// lib/core/error/failures.dart

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);

  final List<dynamic> properties;

  @override
  List<Object?> get props => [properties];
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message});

  @override
  List<Object?> get props => [message];
}
class CacheFailure extends Failure {}

// User-specific failures (can be more granular)
class UserNotFoundFailure extends Failure {
  final String message;
  const UserNotFoundFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class InvalidInputFailure extends Failure {
  final String message;
  const InvalidInputFailure(this.message);

  @override
  List<Object?> get props => [message];
}