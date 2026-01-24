import 'package:car_rental/core/shared_components/data/models/base_host_model.dart';

class BaseCarModel {
 final String name;
final  double price;
final  double rate;
 final int trips;
 final List<String> imagesUrl;
 BaseHostModel hostModel;
 final String availability;
 final String image;
 final String carNumber;
  BaseCarModel({required this.availability,required this.image,required this.carNumber, required this.name, required this.price,
    required this.rate, required this.trips, required this.imagesUrl,required this.hostModel});
 factory BaseCarModel.fromJson(Map<String, dynamic> json) {
  return BaseCarModel(
   name: json['name'] as String,
   price: (json['price'] as num).toDouble(),
   rate: (json['rate'] as num).toDouble(),
   trips: json['trips'] as int,
   imagesUrl: List<String>.from(json['imagesUrl'] as List<dynamic>),
   // To handle the nested object, we call its own fromJson method.
   hostModel: BaseHostModel.fromJson(json['hostModel'] as Map<String, dynamic>),
   availability: json['availability'] as String,
   image: json['image'] as String,
   carNumber: json['carNumber'] as String,
  );
 }
 Map<String, dynamic> toJson() {
  return {
   'name': name,
   'price': price,
   'rate': rate,
   'trips': trips,
   'imagesUrl': imagesUrl,
   // To handle the nested object, we call its own toJson method.
   'hostModel': hostModel.toJson(),
   'availability': availability,
   'image': image,
   'carNumber': carNumber,
  };
 }
}