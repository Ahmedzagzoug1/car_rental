import 'package:bloc/bloc.dart';
import 'package:car_rental/features/driver_information/domain/usecases/send_otp_usecase.dart';
import 'package:car_rental/features/driver_information/domain/usecases/verify_otp_usecase.dart';
import 'package:equatable/equatable.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  OtpCubit(this.sendOtpUsecase, this.verifyOtpUsecase) : super(OtpInitial());
  sendOtp(String phone)async{
    emit(OtpSending());
      final sendOtp = await sendOtpUsecase.call(phone);
      sendOtp.fold((sucess) => emit(OtpSent()), (failure) =>
          emit(OtpSendFailure(failure.toString())));

  }
  verifyOtp(String otp)async{
    emit(OtpVerifying());
    final sendOtp = await verifyOtpUsecase.call(otp);
    sendOtp.fold((sucess) => emit(OtpVerified()), (failure) =>
        emit(OtpVerifyFailure(failure.toString())));

  }
}
