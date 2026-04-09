part of 'payment_cubit.dart';
sealed class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object?> get props => [];
}

final class PaymentInitial extends PaymentState {
  final bool isButtonEnabled;
  final PaymentType selectedType;

  const PaymentInitial(
    {this.isButtonEnabled = false, this.selectedType = PaymentType.card});

  @override
  List<Object?> get props => [isButtonEnabled, selectedType];
}

final class PaymentLoading extends PaymentState {}
//card success with iframe URL and token
class PaymentSuccess extends PaymentState {
  final String url;
  final String? token;
  const PaymentSuccess({required this.url,  this.token});
  @override
  List<Object?> get props => [url, token];
}



final class PaymentFailure extends PaymentState {
  final String errorMessage;
  const PaymentFailure(this.errorMessage);
}