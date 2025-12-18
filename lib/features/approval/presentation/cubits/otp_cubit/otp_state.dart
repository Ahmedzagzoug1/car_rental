part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();
}

final class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}
final class OtpSending extends OtpState {
  @override
  List<Object?> get props => [];
}

final class OtpSent extends OtpState {
  @override
  List<Object?> get props => [];
}

final class OtpSendFailure extends OtpState {
  final String message;

  const OtpSendFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class OtpVerifying extends OtpState {
  @override
  List<Object?> get props => [];
}

final class OtpVerified extends OtpState {
  @override
  List<Object?> get props => [];
}

final class OtpVerifyFailure extends OtpState {
  final String message;

  const OtpVerifyFailure(this.message);

  @override
  List<Object> get props => [message];
}