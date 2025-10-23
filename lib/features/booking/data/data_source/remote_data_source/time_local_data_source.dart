import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:hive/hive.dart';

abstract class BookingTimeLocalDataSource {
  Future<void> saveBooking(TimeModel bookingTime);
  TimeModel? getBooking();
  Future<void> clearBooking();
}

class BookingTimeLocalDataSourceImpl implements BookingTimeLocalDataSource {
  final Box<TimeModel> box;

  BookingTimeLocalDataSourceImpl({ required this.box});

  static const String key = 'current_booking';

  @override
  Future<void> saveBooking(TimeModel bookingTime) async {
    await box.put(key, bookingTime);
  }

  @override
  TimeModel? getBooking() {
    return box.get(key);
  }

  @override
  Future<void> clearBooking() async {
    await box.delete(key);
  }
}
