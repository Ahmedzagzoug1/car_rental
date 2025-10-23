
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pickup_location_model.g.dart';

@JsonSerializable()

@HiveType(typeId: 1)
class PickupLocationModel extends PickupLocationEntity{
  @HiveField(0)
  final String title;
  @HiveField(1)

  final String subtitle;
  @HiveField(2)

  final String price;
  @HiveField(3)

  final double  lat;

  @HiveField(4)

  final double  lng;
  PickupLocationModel({required this.title, required this.subtitle, required this.price
  ,required this.lat,required this.lng}) : super(title: title, subtitle: subtitle, price: price, lat: lat, lng: lng);
  factory PickupLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PickupLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PickupLocationModelToJson(this);

}