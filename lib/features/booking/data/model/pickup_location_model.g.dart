// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PickupLocationModelAdapter extends TypeAdapter<PickupLocationModel> {
  @override
  final int typeId = 2;

  @override
  PickupLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PickupLocationModel(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      price: fields[2] as String,
      lat: fields[3] as double,
      lng: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PickupLocationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickupLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupLocationModel _$PickupLocationModelFromJson(Map<String, dynamic> json) =>
    PickupLocationModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      price: json['price'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PickupLocationModelToJson(
        PickupLocationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'lat': instance.lat,
      'lng': instance.lng,
    };
