import 'package:bloc/bloc.dart';
import 'package:car_rental/features/driver_information/domain/usecases/send_otp_usecase.dart';
import 'package:car_rental/features/driver_information/domain/usecases/verify_otp_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/approval_entity.dart';

part 'approval_state.dart';

class ApprovalCubit extends Cubit<ApprovalState> {
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;

  ApprovalEntity approval = const ApprovalEntity();

  ApprovalCubit(this.sendOtpUsecase, this.verifyOtpUsecase)
      : super(ApprovalInitial());

  void setPhoto(String url) {
   // approval = approval.copyWith(photoUrl: url);
    emit(ApprovalUpdated(approval));
  }

  Future<void> submitPhone(String phone) async {
    emit(ApprovalLoading());
    await sendOtpUsecase(phone);
   // approval = approval.copyWith(phone: phone);
    emit(ApprovalUpdated(approval));
  }

  Future<void> confirmOtp(String otp) async {
    emit(ApprovalLoading());
    final success = await verifyOtpUsecase(otp);
/*
    if (success) {
      approval = approval.copyWith(phoneVerified: true);
      emit(ApprovalUpdated(approval));
    } else {
      emit(ApprovalError("OTP غير صحيح"));
    }*/
  }
}
