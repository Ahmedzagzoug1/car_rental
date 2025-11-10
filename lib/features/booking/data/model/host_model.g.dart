// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HostModelAdapter extends TypeAdapter<HostModel> {
  @override
  final int typeId = 3;

  @override
  HostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HostModel(
      name: fields[0] as String,
      starHost: fields[1] as String,
      joinTime: fields[2] as String,
      trips: fields[3] as int,
      imageUrl: fields[4] as String,
      rate: fields[5] as double,
      responseTime: fields[6] as String,
      phoneNumber: fields[7] as String,
      userId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HostModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.starHost)
      ..writeByte(2)
      ..write(obj.joinTime)
      ..writeByte(3)
      ..write(obj.trips)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.responseTime)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostModel _$HostModelFromJson(Map<String, dynamic> json) => HostModel(
      name: json['name'] as String,
      starHost: json['starHost'] as String,
      joinTime: json['joinTime'] as String,
      trips: (json['trips'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      rate: (json['rate'] as num).toDouble(),
      responseTime: json['responseTime'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$HostModelToJson(HostModel instance) => <String, dynamic>{
      'name': instance.name,
      'starHost': instance.starHost,
      'joinTime': instance.joinTime,
      'trips': instance.trips,
      'imageUrl': instance.imageUrl,
      'rate': instance.rate,
      'responseTime': instance.responseTime,
      'phoneNumber': instance.phoneNumber,
      'userId': instance.userId,
    };
