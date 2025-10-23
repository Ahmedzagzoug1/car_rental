import 'package:car_rental/features/home/domain/entities/car_entity.dart';

class CarsModel extends CarHomeEntity{
  CarsModel({required super.name, required super.rating, required super.availability, required super.price, required super.image, required super.id});
  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
id: json['id'] as String,
      name: json['name'] ,
      price: (json['price'] as num).toDouble(),
      rating: (json['rate'] as num ).toDouble() ,


      availability: json['availability'] ,
      image: json['image'] ,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name ,
      'price': price ,
      'rate': rating ,

      'availability': availability,
      'image': image,
    };
  }
}