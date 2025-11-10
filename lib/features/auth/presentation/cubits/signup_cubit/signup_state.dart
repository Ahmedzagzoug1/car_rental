part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();
}

final class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}
final class SignupSuccess extends SignupState {
 final UserEntity user;
 const SignupSuccess({required this.user});
  @override
  List<Object> get props => [user];
}
final class SignupLoading extends SignupState {
  @override
  List<Object> get props => [];
}
final class SignupFailure extends SignupState {
  final String errMessage;

  SignupFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}