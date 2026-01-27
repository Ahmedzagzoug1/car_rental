// GENERATED CODE - DO NOT MODIFY BY HAND

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
      availability: fields[6] as String,
      imageUrl: fields[7] as String,
      carNumber: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CarModel obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.availability)
      ..writeByte(7)
      ..write(obj.imageUrl)
      ..writeByte(8)
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
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      trips: (json['trips'] as num).toInt(),
      imagesUrl: (json['images_url'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      availability: json['availability'] as String,
      imageUrl: json['image'] as String,
      carNumber: json['car_number'] as String,
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'rate': instance.rate,
      'trips': instance.trips,
      'images_url': instance.imagesUrl,
      'availability': instance.availability,
      'image': instance.imageUrl,
      'car_number': instance.carNumber,
    };
