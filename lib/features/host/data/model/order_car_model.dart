import 'package:car_rental/core/shared_components/data/models/base_car_model.dart';
import 'package:car_rental/features/driver_information/data/model/driver_model.dart';
import 'package:car_rental/features/host/domain/entities/order_car_entity.dart';

class OrderCarModel{
  final BaseCarModel carModel;
  final DriverModel driverModel;

  final String dateOfRental;

  OrderCarModel(
  {
    required this.carModel,
    required this.dateOfRental,
    required this.driverModel,

}
      );
  factory OrderCarModel.fromJson(Map<String, dynamic> json) {
    return OrderCarModel(
      carModel: BaseCarModel.fromJson(json['car_model'] as Map<String, dynamic>),
      driverModel: DriverModel.fromJson(json['driver_model'] as Map<String, dynamic>),
      dateOfRental: json['date_of_rental'] as String,
    );
  }

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
  }
}