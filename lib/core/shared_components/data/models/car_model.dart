import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
 final String id;
 final String name;
final  double price;
final  double rate;
 final int trips;
 final List<String> imagesUrl;
 final String  host;
 final String availability;
 final String image;
 final String carNumber;
 final List<String> pickupLocationModels;
  CarModel({required this.availability,required this.image,required this.carNumber, required this.name, required this.price,
    required this.rate, required this.trips, required this.imagesUrl,required this.host,
  required this.id,required this.pickupLocationModels});
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
   host: json['host'] ,
   availability: json['availability'] as String,
   image: json['image'] as String,
   carNumber: json['carNumber'] as String,
   id: json['id'],
      pickupLocationModels: json['pickup_locations']
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
   'host': host,
   'availability': availability,
   'image': image,
   'carNumber': carNumber,
   'id':id,
   'pickup_locations':pickupLocationModels
  };
 }
}
