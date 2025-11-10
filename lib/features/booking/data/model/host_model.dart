import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part 'host_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class HostModel extends HostEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String starHost;

  @HiveField(2)
  final String joinTime;

  @HiveField(3)
  final int trips;

  @HiveField(4)
  final String imageUrl;

  @HiveField(5)
  final double rate;

  @HiveField(6)
  final String responseTime;

  @HiveField(7)
  final String phoneNumber;

  @HiveField(8)
  final String userId;

  HostModel({
    required this.name,
    required this.starHost,
    required this.joinTime,
    required this.trips,
    required this.imageUrl,
    required this.rate,
    required this.responseTime,
    required this.phoneNumber,
    required this.userId,
  }) : super(
    name: name,
    starHost: starHost,
    joinTime: joinTime,
    trips: trips,
    imageUrl: imageUrl,
    rate: rate,
    responseTime: responseTime,
    phoneNumber: phoneNumber,
    userId: userId,
  );

  /// JSON serialization
  factory HostModel.fromJson(Map<String, dynamic> json) =>
      _$HostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HostModelToJson(this);
}
