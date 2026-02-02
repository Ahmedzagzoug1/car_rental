// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarDetailsModelAdapter extends TypeAdapter<CarDetailsModel> {
  @override
  final int typeId = 7;

  @override
  CarDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarDetailsModel(
      id: fields[0] as String,
      name: fields[1] as String,
      pricePerHour: fields[2] as double,
      rate: fields[3] as double,
      trips: fields[4] as int,
      imagesUrl: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CarDetailsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.pricePerHour)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.trips)
      ..writeByte(5)
      ..write(obj.imagesUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDetailsModel _$CarDetailsModelFromJson(Map<String, dynamic> json) =>
    CarDetailsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      pricePerHour: (json['price'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      trips: (json['trips'] as num).toInt(),
      imagesUrl: (json['images_url'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CarDetailsModelToJson(CarDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.pricePerHour,
      'rate': instance.rate,
      'trips': instance.trips,
      'images_url': instance.imagesUrl,
    };
