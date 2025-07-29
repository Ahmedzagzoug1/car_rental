import 'dart:math';

import 'package:equatable/equatable.dart';

class CarDetailsEntity extends Equatable {
  String name;
  double price;
  double rate;
  int trips;
  List<String> imagesUrl;

  CarDetailsEntity({required this.name, required this.price,
    required this.rate, required this.trips, required this.imagesUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [name,price,rate,trips,imagesUrl];
}