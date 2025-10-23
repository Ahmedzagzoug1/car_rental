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
class CacheFailure extends Failure {
  final String? message;
  const CacheFailure({this.message});

  @override
  List<Object?> get props => [message];
}
class  OfflineFailure extends Failure{
  final String message;
  const OfflineFailure(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class NotFoundFailure extends Failure {
  final String message;
  const NotFoundFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class InvalidInputFailure extends Failure {
  final String message;
  const InvalidInputFailure(this.message);

  @override
  List<Object?> get props => [message];
}