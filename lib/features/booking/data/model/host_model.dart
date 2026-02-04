

import 'package:car_rental/core/cache/hive/hive_type_ids.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/timestamp_converter.dart';
part 'host_model.g.dart';
@HiveType(typeId: HiveTypeIds.host)
@JsonSerializable()
class HostModel  {

  @HiveField(0)
  final String name;

  @HiveField(1)
  @JsonKey(name: 'star_host')
  final String starHost;

  @HiveField(2)
  @JsonKey(name: 'createdAt')
  @TimestampConverter()
  final DateTime joinTime;

  @HiveField(3)
  final int trips;

  @HiveField(4)
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @HiveField(5)
  final double rate;

  @HiveField(6)
  @JsonKey(name: 'response_time')
  final String responseTime;

  @HiveField(7)
  @JsonKey(name: 'phone')
  final String phoneNumber;

  const HostModel({
    required this.name,
    required this.starHost,
    required this.joinTime,
    required this.trips,
    required this.imageUrl,
    required this.rate,
    required this.responseTime,
    required this.phoneNumber,
  });

  factory HostModel.fromJson(Map<String, dynamic> json) =>
      _$HostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HostModelToJson(this);
  HostEntity toDomain(){
    return HostEntity(name: name, starHost: starHost, trips: trips, responseTime: responseTime,
        rate: rate, joinTime: joinTime, imageUrl: imageUrl, phoneNumber: phoneNumber);
  }
}
