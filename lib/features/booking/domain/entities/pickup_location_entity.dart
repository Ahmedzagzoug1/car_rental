import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickupLocationEntity  extends Equatable{
  final String title;
  final String subtitle;
  final String price;
final double lat;
  final double lng;

const  PickupLocationEntity({required this.title, required this.subtitle, required this.price,
  required this.lat,required this.lng});

  @override
  // TODO: implement props
  List<Object?> get props => [title,subtitle,price,lat,lng];
}