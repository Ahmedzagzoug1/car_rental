// lib/core/usecases/usecase.dart

import 'package:car_rental/core/error/failures.dart';
import 'package:dartz/dartz.dart'; // For Either
import 'package:equatable/equatable.dart';

// Abstract class for use cases that return a type R and take parameters P
abstract class UseCase<R, P> {
  Future<Either<Failure, R>> call(P params);
}

// Use case for when no parameters are needed
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}