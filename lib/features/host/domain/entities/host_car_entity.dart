
import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:equatable/equatable.dart';

class HostCarEntity extends Equatable{

  final String name;
  final double rating;
  final String carNumber;
  final double price;
  final String image;

  HostCarEntity({required this.name, required this.
  rating, required this.carNumber, required this.price, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props =>[name,rating,carNumber,price,image];
}