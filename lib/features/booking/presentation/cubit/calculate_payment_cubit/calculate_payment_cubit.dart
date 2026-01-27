import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/calculate_payment_usecase.dart';

part '../calculate_payment_cubit/calculate_payment_state.dart';

class CalculatePaymentCubit extends Cubit<CalculatePaymentState> {

  final CalculatePaymentUseCase calculatePaymentUseCase;
  CalculatePaymentCubit(this.calculatePaymentUseCase) : super(CalculatePaymentInitial());


  void calculate({
    required double pricePerDay,
    required int days,
    required double tripFee,
    double discount = 0,
  }) {
    final total = calculatePaymentUseCase(
      pricePerDay: pricePerDay,
      days: days,
      tripFee: tripFee,
      discount: discount,
    );

    emit(PaymentCalculated(totalAmount: total));
  }
}
