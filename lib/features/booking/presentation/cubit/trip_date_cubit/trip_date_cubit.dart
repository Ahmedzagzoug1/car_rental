import 'package:bloc/bloc.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'trip_date_state.dart';

class TripDateCubit extends Cubit<TripDateState> {
  final now = DateTime.now();

  TripDateCubit()
      : super(_getInitialState());

  void updateRange(DateTime? start, DateTime? end) {
    final newState = TimeEntity(
      pickupDate: start != null ? DateFormat('dd MMM, E').format(start) : '',
      pickupTime: state.timeEntity.pickupTime,
      returnDate: end != null ? DateFormat('dd MMM, E').format(end) : '',
      returnTime: state.timeEntity.returnTime,
    );
    emit(TripDateChanged(newState, rangeStart: start, rangeEnd: end));
  }


  void updateReturnTime(double value) {
    final time = _formatSliderValue(value);
    emit(TripDateChanged(
      state.timeEntity.copyWith(returnTime: time),
      rangeStart: state.rangeStart,
      rangeEnd: state.rangeEnd,
    ));
  }
  void reset(){
    emit(_getInitialState());
  }
  void updatePickupTime(double value) {
    int totalMinutes = (value * 15).toInt();
    final timeString = DateFormat('hh:mm a').format(
        DateTime(2024, 1, 1, totalMinutes ~/ 60, totalMinutes % 60)
    );

    emit(TripDateChanged(
      state.timeEntity.copyWith(pickupTime: timeString),
      rangeStart: state.rangeStart,
      rangeEnd: state.rangeEnd,
    ));
  }
  String _formatSliderValue(double value) {
    int totalMinutes = (value * 15).toInt();
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    DateTime dt = DateTime(2024, 1, 1, hours, minutes);
    return DateFormat('hh:mm a').format(dt);
  }
  // initial time and date
  //format
  static final _dateFormatter = DateFormat('dd MMM, E');
  static final _timeFormatter = DateFormat('hh:mm a');
  static TripDateState _getInitialState() {
    final now = DateTime.now();
    final nextWeek = now.add(const Duration(days: 7));

    return TripDateInitial(
      TimeEntity(
        pickupDate: _dateFormatter.format(now),
        pickupTime: _timeFormatter.format(now),
        returnDate: _dateFormatter.format(nextWeek),
        returnTime: _timeFormatter.format(nextWeek),
      ),
      rangeStart: now,
      rangeEnd: nextWeek,
    );
  }
  void saveSelection(TimeEntity selectedTime) {
    emit(TripDateSaved(selectedTime));
  }
}
