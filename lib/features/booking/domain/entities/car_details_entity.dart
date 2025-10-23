import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CarDetailsEntity extends Equatable {
  String name;
  double price;
  double rate;
  int trips;
  List<String> imagesUrl;
DocumentReference host;
  CarDetailsEntity({required this.name, required this.price,
    required this.rate, required this.trips, required this.imagesUrl,
  required this.host});

  @override
  // TODO: implement props
  List<Object?> get props => [name,price,rate,trips,imagesUrl,host];
}