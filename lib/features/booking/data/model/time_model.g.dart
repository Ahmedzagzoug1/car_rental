// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeModelAdapter extends TypeAdapter<TimeModel> {
  @override
  final int typeId = 1;

  @override
  TimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeModel(
      pickupDate: fields[0] as String,
      pickupTime: fields[1] as String,
      returnDate: fields[2] as String,
      returnTime: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pickupDate)
      ..writeByte(1)
      ..write(obj.pickupTime)
      ..writeByte(2)
      ..write(obj.returnDate)
      ..writeByte(3)
      ..write(obj.returnTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeModel _$TimeModelFromJson(Map<String, dynamic> json) => TimeModel(
      pickupDate: json['pickupDate'] as String,
      pickupTime: json['pickupTime'] as String,
      returnDate: json['returnDate'] as String,
      returnTime: json['returnTime'] as String,
    );

Map<String, dynamic> _$TimeModelToJson(TimeModel instance) => <String, dynamic>{
      'pickupDate': instance.pickupDate,
      'pickupTime': instance.pickupTime,
      'returnDate': instance.returnDate,
      'returnTime': instance.returnTime,
    };
