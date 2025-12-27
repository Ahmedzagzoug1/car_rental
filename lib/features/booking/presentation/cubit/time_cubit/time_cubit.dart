import 'package:bloc/bloc.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/save_time_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/services/service_locators.dart';
import '../../../domain/repositories/time_repository.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit(this.getTimeUsecase, this.saveTimeUsecase) : super(TimeInitial());
final GetTimeUsecase getTimeUsecase;
final SaveTimeUsecase saveTimeUsecase;


  Future<void> saveTime(TimeEntity timeEntity) async {
    try {
      saveTimeUsecase.call(timeEntity);

      emit(TimeSuccess(timeEntity));
    } catch (e) {
      emit(TimeError(e.toString()));
    }
  }

  Future<TimeEntity?> getTime() async {
    try {
final Either<Failure, TimeEntity?> time=
await      GetTimeUsecase(timeRepository: sl<TimeRepository>()).call();
print(time.toString());
time.fold((failure)=>failure, (success){
emit(TimeSuccess(success as TimeEntity ));
return success;
});


    } catch (e) {
      return null;
    }
    return null;
  }
  void selectTime(TimeEntity entity) {
    emit(TimeSelected( timeEntity: entity));
  }
}
