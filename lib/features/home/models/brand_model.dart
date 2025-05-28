import 'package:car_rental/core/resources/assets_manager.dart';

class BrandModel {
  final String brandName;
final  String imageSrc;

  BrandModel({required this.brandName,required this.imageSrc});
 static final  AllBrands=[
   BrandModel(brandName: 'tesla', imageSrc: ImageAssets.teslaBrand),
   BrandModel(brandName: 'BMW', imageSrc: ImageAssets.bMWBrand),
   BrandModel(brandName: 'Ferrari', imageSrc: ImageAssets.ferrariBrand),
  ];
  
}