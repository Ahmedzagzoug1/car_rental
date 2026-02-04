
import 'package:car_rental/core/cache/hive/hive_type_ids.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pickup_location_model.g.dart';

@JsonSerializable()

@HiveType(typeId: HiveTypeIds.location)
class PickupLocationModel {
  @JsonKey(name:'title')
  @HiveField(0)
  final String title;

  @HiveField(1)
  @JsonKey(name:'subtitle')

  final String subtitle;

  @JsonKey(name:'price')
  @HiveField(2)
  final double price;

  @JsonKey(name:'lat')
  @HiveField(3)
  final double  lat;

  @JsonKey(name:'lng')
  @HiveField(4)
  final double  lng;
  const PickupLocationModel({required this.title, required this.subtitle, required this.price
  ,required this.lat,required this.lng});
  factory PickupLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PickupLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PickupLocationModelToJson(this);
  PickupLocationEntity toDomain(){
    return PickupLocationEntity(title: title, subtitle: subtitle, price: price, lat: lat, lng: lng);
  }
}