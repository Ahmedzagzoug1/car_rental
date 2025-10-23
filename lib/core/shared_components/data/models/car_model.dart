import 'package:car_rental/core/shared_components/data/models/host_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
 final String name;
final  double price;
final  double rate;
 final int trips;
 final List<String> imagesUrl;
 DocumentReference hostRef;
 final String availability;
 final String image;
 final String carNumber;
  CarModel({required this.availability,required this.image,required this.carNumber, required this.name, required this.price,
    required this.rate, required this.trips, required this.imagesUrl,required this.hostRef});
 factory CarModel.fromJson(Map<String, dynamic> json) {
  return CarModel(

   name: json['name'] as String,
   price: (json['price']) as double,
   rate: (json['rate']) as double,
   trips: (json['trips']),
   imagesUrl:  (json['images_url'] as List<dynamic>?)
       ?.map((item) => item.toString())
       .toList()
       ?? [],
   // To handle the nested object, we call its own fromJson method.
   hostRef: json['hostRef'] ,
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
   'hostModel': hostRef,
   'availability': availability,
   'image': image,
   'carNumber': carNumber,
  };
 }
}