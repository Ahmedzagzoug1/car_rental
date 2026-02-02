import 'package:bloc/bloc.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../domain/usecases/get_host_usecase.dart';

part 'host_state.dart';
/*
class HostCubit extends Cubit<HostState> {

 final GetHostUsecase getHostUsecase;
  HostCubit(this.getHostUsecase) : super(HostInitial());
  getHost(carId)async{
    try{
      print('get host  $carId');
      emit(HostLoading());
      final result=await getHostUsecase.getHost(carId);
      result.fold((failure){
        emit(HostFailure(errMessage: failure.toString()));
      }, (success){
        emit(HostLoaded(hostEntity: success));
      });
    }catch(e){
      emit(HostFailure(errMessage: e.toString()));

    }


     // return DateFormat('yyyy-MM-dd HH:mm').format(date);
    }

  }
String joinDateFromTimestamp(DateTime td) {
  print(td);
  final formatted = DateFormat('MMM yyyy').format(td);
  print(formatted);
  return "Joined $formatted";
*/
