import 'package:car_rental/features/booking/domain/entities/time_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_model.g.dart';

@JsonSerializable()

@HiveType(typeId: 1)
class TimeModel extends TimeEntity {
  @override
  @HiveField(0)
  final String pickupDate;

  @override
  @HiveField(1)
  final String pickupTime;

  @override
  @HiveField(2)
  final String returnDate;

  @override
  @HiveField(3)
  final String returnTime;

  const TimeModel({
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
