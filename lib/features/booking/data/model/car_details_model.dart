import 'package:car_rental/core/cache/hive/hive_type_ids.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_details_model.g.dart';
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.carDetails)
class CarDetailsModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: 'price')
  final double pricePerHour;
  @HiveField(3)
  final double rate;
  @HiveField(4)
  final int trips;
  @HiveField(5)
  @JsonKey(name: 'images_url')
  final List<String> imagesUrl;

  CarDetailsModel({
    required this.id,
    required this.name,
    required this.pricePerHour,
    required this.rate,
    required this.trips,
    required this.imagesUrl,
  }) ;

  CarDetailsEntity toDomain(HostEntity hostEntity, List<PickupLocationEntity> locationsList) {
    return CarDetailsEntity(
      id: id,
      name: name,
      pricePerHour: pricePerHour,
      rate: rate,
      trips: trips,
      imagesUrl: imagesUrl,
      host: hostEntity,
      locations: locationsList,
    );
  }

  factory CarDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CarDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarDetailsModelToJson(this);
}


