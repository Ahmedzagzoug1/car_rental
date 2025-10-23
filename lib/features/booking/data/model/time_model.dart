import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_model.g.dart';

@JsonSerializable()

@HiveType(typeId: 1)
class TimeModel extends TimeEntity {
  @HiveField(0)
  final String pickupDate;

  @HiveField(1)
  final String pickupTime;

  @HiveField(2)
  final String returnDate;

  @HiveField(3)
  final String returnTime;

  TimeModel({
    required this.pickupDate,
    required this.pickupTime,
    required this.returnDate,
    required this.returnTime,
  }) : super(
    pickupDate: pickupDate,
    pickupTime: pickupTime,
    returnDate: returnDate,
    returnTime: returnTime,
  );

  factory TimeModel.fromEntity(TimeEntity entity) {
    return TimeModel(
      pickupDate: entity.pickupDate,
      pickupTime: entity.pickupTime,
      returnDate: entity.returnDate,
      returnTime: entity.returnTime,
    );
  }

  factory TimeModel.fromJson(Map<String, dynamic> json) =>
      _$TimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeModelToJson(this);
}
