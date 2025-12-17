// lib/core/error/failures.dart

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
 const ServerFailure() : super('Server Failure');



}
class CacheFailure extends Failure {
 const CacheFailure():super('Cache Failure');


}
class  OfflineFailure extends Failure{
  const OfflineFailure():super('Offline Failure');

}
class NotFoundFailure extends Failure {
  const NotFoundFailure():super('Not Found Failure');

}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure():super('Invalid Input Failure');


}
class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(): super('Empty Cache Failure');


}
class AuthFailure extends Failure {
  const AuthFailure(): super('auth Failure');


}



class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure():super('Email Already InUse Failure');

}




class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure( ):super('Weak Password Failure');

}
class InvalidEmailFailure extends Failure{
  const InvalidEmailFailure():super('Invalid Email Failure');
}