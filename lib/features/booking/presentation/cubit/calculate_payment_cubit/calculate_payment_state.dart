part of '../calculate_payment_cubit/calculate_payment_cubit.dart';



sealed class CalculatePaymentState extends Equatable {
  const CalculatePaymentState();
}

final class CalculatePaymentInitial extends CalculatePaymentState {
  @override
  List<Object> get props => [];
}
final class PaymentCalculated extends CalculatePaymentState{
 final  double totalAmount;

  PaymentCalculated({required this.totalAmount});
 @override
 List<Object> get props => [totalAmount];
}