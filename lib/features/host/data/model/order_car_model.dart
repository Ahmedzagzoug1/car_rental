import 'package:car_rental/core/shared_components/data/models/car_model.dart';
import 'package:car_rental/features/host/domain/entities/order_car_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderCarModel{
 /* final
  DocumentReference carModel;
  final DriverModel driverModel;

  final String dateOfRental;

  OrderCarModel(
  {
    required this.carModel,
    required this.dateOfRental,
    required this.driverModel,

}
      );

  /// A method to convert an [OrderCarModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'carModel': carModel.toJson(),
      'driverModel': driverModel.toJson(),
      'date_of_rental': dateOfRental
    };
    }
    OrderCarEntity toDomain(){
    return OrderCarEntity(name: carModel.name,
        dateOfRental: dateOfRental, rentalPersonName: driverModel.name,
        rentalPersonNumber: driverModel.mobileNumber, imageUrl: carModel.image);
  }*/
}