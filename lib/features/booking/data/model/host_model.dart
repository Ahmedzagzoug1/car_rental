

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/timestamp_converter.dart';
import '../../../host/domain/entities/host_entity.dart';
part 'host_model.g.dart';
@HiveType(typeId: 3)
@JsonSerializable()
class HostModel extends HostEntity {
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

  HostModel({
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
