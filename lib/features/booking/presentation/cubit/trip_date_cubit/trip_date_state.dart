part of 'trip_date_cubit.dart';

abstract class TripDateState extends Equatable {
  final TimeEntity timeEntity;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;

  const TripDateState(this.timeEntity, {this.rangeStart, this.rangeEnd});

  @override
  List<Object?> get props => [timeEntity, rangeStart, rangeEnd];
}

class TripDateInitial extends TripDateState {
  TripDateInitial(super.timeEntity, {super.rangeStart, super.rangeEnd});
}

class TripDateChanged extends TripDateState {
  TripDateChanged(super.timeEntity, {super.rangeStart, super.rangeEnd});
}
class TripDateSaved extends TripDateState{
  TripDateSaved(super.timeEntity);
}