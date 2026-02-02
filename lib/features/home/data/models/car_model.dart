import 'package:car_rental/core/cache/hive/hive_type_ids.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@HiveType(typeId: HiveTypeIds.car)
@JsonSerializable()
class CarModel {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final double rate;

  @HiveField(4)
  final int trips;

  @HiveField(5)
  @JsonKey(name :'images_url')
  final List<String> imagesUrl;

  @HiveField(6)
  final String availability;

  @HiveField(7)
  @JsonKey(name :'image')
  final String imageUrl;

  @HiveField(8)
  @JsonKey(name :'car_number')
  final String carNumber;

  CarModel( {
    required this.id ,
  required this.name,
  required this.price,
  required this.rate,
  required this.trips,
  required this.imagesUrl,

    required this.availability, required this.imageUrl,
  required this.carNumber
  }) ;

  // JSON serialization methods
  factory CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarModelToJson(this);


 CarHomeEntity toEntity() {
    return CarHomeEntity(name: name,
        id: id,
        rating: rate,
        availability: availability,
        price: price,
         imageUrl: imageUrl);
  }
  }
  /*
  * // GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarModelAdapter extends TypeAdapter<CarModel> {
  @override
  final int typeId = 5;

  @override
  CarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarModel(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      rate: fields[3] as double,
      trips: fields[4] as int,
      imagesUrl: (fields[5] as List).cast<String>(),
      host: fields[6] as String,
      availability: fields[8] as String,
      imageUrl: fields[9] as String,
      pickupLocationModels: (fields[7] as List?)?.cast<PickupLocationModel>(),
      carNumber: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CarModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.trips)
      ..writeByte(5)
      ..write(obj.imagesUrl)
      ..writeByte(6)
      ..write(obj.host)
      ..writeByte(7)
      ..write(obj.pickupLocationModels)
      ..writeByte(8)
      ..write(obj.availability)
      ..writeByte(9)
      ..write(obj.imageUrl)
    ..writeByte(10)
    ..write(obj.carNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      id: json['id'] as String ??'',
      name: json['name'] as String ??'',
      price: (json['price'] as num).toDouble() ??0,
      rate: (json['rate'] as num).toDouble() ??0,
      trips: (json['trips'] as num).toInt() ??0,
      imagesUrl:
          (json['images_url'] as List<dynamic>).map((e) => e as String).toList(),
      host: json['host'] as String ??'',
      availability: json['availability'] as String ??'',
      imageUrl: json['image'] as String ??'',
      pickupLocationModels: (json['pickup_locations'] as List<dynamic>?)
          ?.map((e) => PickupLocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  carNumber: json['car_number'] as String ??''
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'rate': instance.rate,
      'trips': instance.trips,
      'images_url': instance.imagesUrl,
      'host': instance.host,
      'pickup_locations': instance.pickupLocationModels,
      'availability': instance.availability,
      'image': instance.imageUrl,
  'car_number':instance.carNumber
    };
*/