part of 'phone_auth_cubit.dart';

sealed class PhoneAuthState extends Equatable {
  const PhoneAuthState();
}

final class PhoneAuthInitial extends PhoneAuthState {
  @override
  List<Object> get props => [];
}
