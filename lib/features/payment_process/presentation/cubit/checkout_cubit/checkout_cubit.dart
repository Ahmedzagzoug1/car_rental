import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/check_user_eligibility.dart';
import '../../../domain/usecases/execute_payment.dart';
import '../../../domain/usecases/select_payment_method.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckUserEligibility checkUserEligibility;
  final ExecutePayment executePayment;
  final SelectPaymentMethod selectPaymentMethod;

  CheckoutCubit(
      this.checkUserEligibility,
      this.executePayment,
      this.selectPaymentMethod,
      ) : super(CheckoutInitial());

  void selectMethod(String method) {
    selectPaymentMethod.call(method);
    emit(CheckoutMethodSelected(method));
  }

  Future<void> checkout(String userId) async {
    emit(CheckoutLoading());
    final canCheckout = await checkUserEligibility.call(userId);

    if (!canCheckout) {
      emit(CheckoutFailure("You are not eligible to checkout"));
      return;
    }

    final method = selectPaymentMethod.selectedMethod;
    if (method == null) {
      emit(CheckoutFailure("Please select a payment method"));
      return;
    }

    final result = await executePayment.call(userId, method);
    if (result.success) {
      emit(CheckoutSuccess(result.message));
    } else {
      emit(CheckoutFailure(result.message));
    }
  }
}
