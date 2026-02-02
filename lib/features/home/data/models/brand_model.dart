import 'package:car_rental/core/cache/hive/hive_type_ids.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brand_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.brand)

class BrandModel  {
  @HiveField(0)
  @JsonKey(name: 'brand_name')
  final String brandName;
  @HiveField(1)
  @JsonKey(name: 'image_source')
  final String imageSrc;

  const BrandModel({required this.brandName, required this.imageSrc});
  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
  BrandEntity toEntity(){
    return BrandEntity(brandName: brandName, imageSrc: imageSrc);
  }
}