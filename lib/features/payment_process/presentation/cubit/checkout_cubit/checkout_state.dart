part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();
}

final class CheckoutInitial extends CheckoutState {
  @override
  List<Object> get props => [];
}
final class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];

}

final class CheckoutMethodSelected extends CheckoutState {
  final String method;

  CheckoutMethodSelected(this.method);
  @override
  List<Object> get props => [method];
}
final class CheckoutSuccess extends CheckoutState {
  final String success;

  CheckoutSuccess(this.success);
  @override
  List<Object> get props => [success];
}
final class CheckoutFailure extends CheckoutState {
  final String message;

  CheckoutFailure(this.message);

  List<Object> get props => [message];
}
