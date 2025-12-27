

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/timestamp_converter.dart';
import '../../../host/domain/entities/host_entity.dart';
part 'host_model.g.dart';
@HiveType(typeId: 3)
@JsonSerializable()
class HostModel extends HostEntity {
  @override
  @HiveField(0)
  final String name;

  @override
  @HiveField(1)
  @JsonKey(name: 'star_host')
  final String starHost;

  @override
  @HiveField(2)
  @JsonKey(name: 'createdAt')
  @TimestampConverter()
  final DateTime joinTime;

  @override
  @HiveField(3)
  final int trips;

  @override
  @HiveField(4)
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  @HiveField(5)
  final double rate;

  @override
  @HiveField(6)
  @JsonKey(name: 'response_time')
  final String responseTime;

  @override
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
  }) : super(
    name: name,
    starHost: starHost,
    joinTime: joinTime,
    trips: trips,

    imageUrl: imageUrl,
    rate: rate,
    responseTime: responseTime,
    phoneNumber: phoneNumber,
  );

  factory HostModel.fromJson(Map<String, dynamic> json) =>
      _$HostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HostModelToJson(this);
}
