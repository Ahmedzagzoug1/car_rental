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
      joinTime: fields[2] as DateTime,
      trips: fields[3] as int,
      imageUrl: fields[4] as String,
      rate: fields[5] as double,
      responseTime: fields[6] as String,
      phoneNumber: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HostModel obj) {
    writer
      ..writeByte(8)
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
      ..write(obj.phoneNumber);
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
      starHost: json['star_host'] as String,
      joinTime:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      trips: (json['trips'] as num).toInt(),
      imageUrl: json['image_url'] as String,
      rate: (json['rate'] as num).toDouble(),
      responseTime: json['response_time'] as String,
      phoneNumber: json['phone'] as String,
    );

Map<String, dynamic> _$HostModelToJson(HostModel instance) => <String, dynamic>{
      'name': instance.name,
      'star_host': instance.starHost,
      'createdAt': const TimestampConverter().toJson(instance.joinTime),
      'trips': instance.trips,
      'image_url': instance.imageUrl,
      'rate': instance.rate,
      'response_time': instance.responseTime,
      'phone': instance.phoneNumber,
    };
