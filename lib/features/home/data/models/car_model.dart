
import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart' ;

class CarModel{

  final String name;
  final double rating;
  final String availability;
  final double price;
  final String image;
  final List<String> imagesUrl;
  final String carNumber;
final int trips;
  CarModel({required this.name, required this.
  rating, required this.availability, required this.price,
    required this.imagesUrl,
    required this.carNumber,
    required this.trips,
    required this.image});
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      name: json['name'] ??'',
      rating: json['rating'] ??0.0, // Handle both int and double from JSON
      availability: json['availability'] ??'',
      price: json['price']??0 ,   // Handle both int and double from JSON
      image: json['image'] ??'',
      carNumber: json['car_number'],
      imagesUrl: json['imagesUrl']??[],
        trips:json['trips']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rating': rating,
      'availability': availability,
      'price': price,
      'image': image,
      'imagesUrl':imagesUrl,
      'car_number':carNumber,
      'trips':trips
    };
  }
CarEntity toCarHomeEntity(){
    return CarEntity(name: name, rating: rating, availability: availability, price: price, image: image);
}
HostCarEntity   toCarHostEntity() {
  return HostCarEntity(name: name,
      rating: rating,
      carNumber: carNumber,
      price: price,
      image: image);
}
CarDetailsEntity toCarDetailsEntity() {
  return CarDetailsEntity(name: name,
      price: price,
      rate: rating,
      trips: trips,
      imagesUrl: imagesUrl);
}

}