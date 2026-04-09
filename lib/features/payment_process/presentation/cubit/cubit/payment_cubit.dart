import 'package:bloc/bloc.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_request_entity.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:car_rental/features/payment_process/domain/usecases/get_payment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final GetPaymentUsecase getPaymentUseCase;
  
  PaymentCubit(this.getPaymentUseCase) : super(PaymentInitial());

PaymentType _currentType = PaymentType.card;

  void updateFormStatus(bool isValid, PaymentType type) {
    _currentType = type;
    emit(PaymentInitial(isButtonEnabled: isValid, selectedType: type));
  }
  
  void getPaymentData() async {
  emit(PaymentLoading());

  final result = await getPaymentUseCase(_currentType);

  result.fold(
    (failure) => emit(PaymentFailure(failure.message)),
    (response) {
      if (response.paymentType == 'card' && response.iframeUrl != null) {
        emit(PaymentSuccess(url: response.iframeUrl!, 
        token: response.token!));
      } else {
        emit(PaymentSuccess(url: response.redirectUrl!));
      }
    },
  );
} 
emitSuccess(){
  emit(PaymentSuccess(url: 'https://example.com/success'));
}
emitFailure(String message){
  emit(PaymentFailure(message));    
}
}
