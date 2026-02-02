
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:equatable/equatable.dart';

class CarDetailsEntity extends Equatable{
  final String id;
  final String name;
  final double rate;
  final double pricePerHour;
  final int trips;
 final List<String> imagesUrl;

  final HostEntity? host;
  final List<PickupLocationEntity>? locations;

  CarDetailsEntity({
    required this.id,
    required this.name,
    required this.pricePerHour,
    required this.rate,
    required this.trips,
    required this.imagesUrl,
    this.host,
    this.locations,
  });

  @override
  List<Object?> get props => [id,name,pricePerHour,rate,trips,imagesUrl,locations,host];
}