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
  const TripDateInitial(super.timeEntity, {super.rangeStart, super.rangeEnd});
}

class TripDateChanged extends TripDateState {
  const TripDateChanged(super.timeEntity, {super.rangeStart, super.rangeEnd});
}
class TripDateSaved extends TripDateState{
  const TripDateSaved(super.timeEntity);
}