// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrandModelAdapter extends TypeAdapter<BrandModel> {
  @override
  final int typeId = 5;

  @override
  BrandModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrandModel(
      brandName: fields[0] as String,
      imageSrc: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BrandModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.brandName)
      ..writeByte(1)
      ..write(obj.imageSrc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      brandName: json['brand_name'] as String,
      imageSrc: json['image_source'] as String,
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'brand_name': instance.brandName,
      'image_source': instance.imageSrc,
    };
