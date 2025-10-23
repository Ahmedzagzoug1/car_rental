
part of 'time_cubit.dart';


abstract class TimeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimeInitial extends TimeState {}

class TimeLoading extends TimeState {}

class TimeSuccess extends TimeState {
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

