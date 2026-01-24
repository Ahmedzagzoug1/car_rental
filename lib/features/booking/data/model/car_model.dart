import 'dart:math';

import 'package:car_rental/core/shared_components/data/models/base_car_model.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';

class CarModel extends BaseCarModel{
  CarModel({required super.availability, required super.image, required super.carNumber, required super.name,
    required super.price, required super.rate, required super.trips, required super.imagesUrl, required super.hostModel});
  toDomain (){
    return CarEntity(name: name, rating: rate, availability: availability, price: price, image: image);
  }

}