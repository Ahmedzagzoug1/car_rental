
import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:equatable/equatable.dart';

class CarEntity extends Equatable{

  final String name;
  final double rating;
  final String availability;
  final double price;
  final String image;

  CarEntity({required this.name, required this.
  rating, required this.availability, required this.price, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props =>  [name,rating,availability,price,image];
}