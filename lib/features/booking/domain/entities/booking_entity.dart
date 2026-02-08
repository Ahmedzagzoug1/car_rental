import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingEntity {
final CarDetailsEntity carDetailsEntity;
  final PickupLocationEntity pickupLocation;
 final TimeEntity timeEntity;


  BookingEntity({

    required this.pickupLocation,
    required
      this.timeEntity, required this.carDetailsEntity});
copyWith({CarDetailsEntity? carDetailsEntity,
  PickupLocationEntity? pickupLocation,
  TimeEntity? timeEntity}) {
return BookingEntity(
  carDetailsEntity: carDetailsEntity ?? this.carDetailsEntity,
  pickupLocation: pickupLocation ?? this.pickupLocation,
  timeEntity: timeEntity ?? this.timeEntity);
}
}