
import 'package:car_rental/core/shared_components/data/models/base_car_model.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';

class HostCarModel extends BaseCarModel{
  HostCarModel({required super.availability, required super.image, required super.carNumber, required super.name, required super.price, required super.rate, required super.trips, required super.imagesUrl, required super.hostModel});


  HostCarEntity toDomain (){
   return HostCarEntity(name: name, rating: rate, carNumber: carNumber, price: price, image: image);
  }
}