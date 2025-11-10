import 'package:bloc/bloc.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/usecases/email_auth/sign_in_with_email_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'signin_state.dart';

class SigninCubit extends HydratedCubit<

    SigninState> {
  final SignInWithEmailUsecase signInWithEmailUsecase;
  SigninCubit(this.signInWithEmailUsecase) : super(SigninInitial());


  signinWithEmail({
    required String email,
    required String password,
    String? phone,
  }) async {
    emit(SigninLoading());
    try {

  final signin=      await signInWithEmailUsecase.call(
          email: email, password: password, phone: phone);
      signin.fold((failure) =>
          emit(SigninFailure(errMessage: failure.toString())), (success) {
        emit(SigninSuccess(success));
        return success;
      });
    } catch (e) {
      emit(SigninFailure(errMessage: e.toString()));
      return null;
    }
  }

  @override
  SigninState? fromJson(Map<String, dynamic> json) {
     try {
      if (json['user'] != null) {
        final user = UserEntity(
          id: json['user']['id'],
          name: json['user']['name'],
          email: json['user']['email'],
          phone: json['user']['phone'], createdAt:json['user']['created ar'] ,
        );
        return SigninSuccess(user);
      }
      return SigninInitial();
    } catch (_) {
      return SigninInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(SigninState state) {
     if (state is SigninSuccess) {
      final user = (state as SigninSuccess).userEntity;
      return {
        'user': {
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
        },
      };
    }
    return null;
  }

}