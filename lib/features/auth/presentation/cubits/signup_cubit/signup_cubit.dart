import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/usecases/email_auth/sign_up_with_email_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends HydratedCubit<SignupState> {
  final SignUpWithEmailUseCase signUpWithEmailUseCase;

  SignupCubit(this.signUpWithEmailUseCase) : super(SignupInitial());

  signUpWithEmail({
  required String name,
  required String email,
  required String password,
  String? phone,
  })async{


    emit(SignupLoading());
    try {
      final signup=      await signUpWithEmailUseCase.call(
          email: email, password: password, phone: phone, name: name);
      signup.fold((failure) =>
          emit(SignupFailure(errMessage: failure.message)), (success) =>
        emit(SignupSuccess(user: success))

      );


    } catch (e) {
      emit(SignupFailure(errMessage: e.toString()));
      return null;
    }


  }
  @override
  SignupState? fromJson(Map<String, dynamic> json) {
     try {
      if (json['user'] != null) {
        final user = UserEntity(
          id: json['user']['id'],
          name: json['user']['name'],
          email: json['user']['email'],
          phone: json['user']['phone'], createdAt: DateTime.parse(json['user']['createdAt']),
        );
        return SignupSuccess(user: user);
      }
      return SignupInitial();
    } catch (_) {
      return SignupInitial();
    }

  }

  @override
  Map<String, dynamic>? toJson(SignupState state) {
    if (state is SignupSuccess) {
      final user = state.user;
    return {
    'user': {
    'id': user.id,
    'name': user.name,
    'email': user.email,
    'phone': user.phone,
      'createdAt':user.createdAt.toIso8601String()
    },
    };
  }
    return null;
  }
}
