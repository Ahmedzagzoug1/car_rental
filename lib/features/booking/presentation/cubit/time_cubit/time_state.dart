
part of 'time_cubit.dart';


abstract class TimeState extends Equatable {
  late TimeEntity timeEntity;
  @override
  List<Object?> get props => [];
}

class TimeInitial extends TimeState {
 @override
  final  timeEntity = TimeEntity(
  pickupDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  pickupTime: DateFormat('hh:mm a').format(DateTime.now()),
  returnDate:
  DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7))),
  returnTime: DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1))),
  );
@override
  List<Object?> get props => [timeEntity];
}



class TimeSuccess extends TimeState {
  @override
  final TimeEntity timeEntity;
  TimeSuccess(this.timeEntity);

  @override
  List<Object?> get props => [timeEntity];
}

class TimeError extends TimeState {
  final String message;
  TimeError(this.message);

  @override
  List<Object?> get props => [message];
}

class TimeSelected extends TimeState {
  @override
  final TimeEntity timeEntity;
   TimeSelected({required this.timeEntity});

  @override
  List<Object?> get props => [timeEntity];
}

class TimeSaved extends TimeState {}
