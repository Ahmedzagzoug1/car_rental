
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:equatable/equatable.dart';

class CarDetailsEntity extends Equatable {
  String id;
  String name;
  double price;
  double rate;
  int trips;
  List<String> imagesUrl;
 List<PickupLocationModel> pickupLocationEntities;
  CarDetailsEntity({required this.id,required this.name, required this.price,
    required this.rate, required this.trips, required this.imagesUrl,
  required this.pickupLocationEntities});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,price,rate,trips,imagesUrl,pickupLocationEntities];
}