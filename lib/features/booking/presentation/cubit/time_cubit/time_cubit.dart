import 'package:bloc/bloc.dart';
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/booking/data/repositories/time_repository_impl.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/clear_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/save_time_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../../core/services/service_locators.dart';
import '../../../data/model/time_model.dart';
import '../../../domain/repositories/time_repository.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit(this.getTimeUsecase, this.saveTimeUsecase) : super(TimeInitial());
final GetTimeUsecase getTimeUsecase;
final SaveTimeUsecase saveTimeUsecase;
  late TimeModel _currentTime;
  final String _boxName = 'timeBox';

  Future<void> saveTime(TimeEntity timeEntity) async {
    emit(TimeLoading());
    try {
      saveTimeUsecase.call(timeEntity);

      emit(TimeSuccess(timeEntity));
    } catch (e) {
      emit(TimeError(e.toString()));
    }
  }

  Future<TimeEntity?> getTime() async {
    emit(TimeLoading());
    print('time loaddig');
    try {
final Either<Failure, TimeEntity?> time=
await      GetTimeUsecase(timeRepository: sl<TimeRepository>()).call();
print(time.toString());
time.fold((failure)=>failure, (success){
emit(TimeSuccess(success as TimeEntity ));
return success;
});


    } catch (e) {
      emit(TimeError(e.toString()));
      return null;
    }
  }
}
