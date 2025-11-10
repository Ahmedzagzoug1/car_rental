part of 'signin_cubit.dart';

sealed class SigninState extends Equatable {
  const SigninState();
}


final class SigninInitial extends SigninState {
  @override
  List<Object> get props => [];
}
final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess(this.userEntity);

  @override
  List<Object> get props => [];
}
final class SigninLoading extends SigninState {
  @override
  List<Object> get props => [];
}

final class SigninFailure extends SigninState {
  final String errMessage;

  SigninFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
