import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brand_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)

class BrandModel  {
  @HiveField(0)
  final String brandName;
  @HiveField(1)
  final String imageSrc;

  const BrandModel({required this.brandName, required this.imageSrc});
  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}