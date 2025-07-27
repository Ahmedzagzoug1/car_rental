import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String brandName;
final  String imageSrc;

  BrandEntity({required this.brandName,required this.imageSrc});


  @override
  // TODO: implement props
  List<Object?> get props => [brandName,imageSrc];
  
}