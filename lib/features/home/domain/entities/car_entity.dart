
import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:equatable/equatable.dart';

class CarHomeEntity extends Equatable{
final String id;
  final String name;
  final double rating;
  final String availability;
  final double price;
  final String image;

  CarHomeEntity({required this.name,
    required this.id,required this.
  rating, required this.availability, required this.price, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props =>  [name,rating,availability,price,image];
}