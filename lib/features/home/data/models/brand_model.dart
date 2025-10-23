import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {

  BrandModel({required super.brandName,required super.imageSrc});
factory BrandModel.formJson(Map<String,dynamic> json){
  return BrandModel(
    brandName: json['brand_name'],
    imageSrc: json['image_source']
  );
  }
  Map<String,dynamic> toJson(BrandModel brandModel){
  return {
    'brand_name':brandModel.brandName,
    'image_source':brandModel.imageSrc
  };
  }
  BrandEntity toBrandEntity(){
  return BrandEntity(brandName: brandName, imageSrc: imageSrc);
  }
}