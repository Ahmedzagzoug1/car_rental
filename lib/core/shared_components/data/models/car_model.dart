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

Future<void> seedCars() async {
 final firestore = FirebaseFirestore.instance;
 final carsCollection = firestore.collection('cars');

 final cars = [
  CarModel(
   id: 'car1',
   name: 'Toyota Corolla',
   carNumber: 'Sharqia25326',
   availability: 'At 5 Days',
   price: 500.5,
   pickupLocationModels: [],
   rate: 4.5,
   trips: 10,
   image: 'https://i.pinimg.com/originals/00/e3/96/00e3961edeffe685700b6e3dddb3e6d2.jpg',
   imagesUrl: [
    'https://i.pinimg.com/originals/00/e3/96/00e3961edeffe685700b6e3dddb3e6d2.jpg',
    'https://i.pinimg.com/originals/93/aa/91/93aa91354e75e5f623657c1d44e9a50a.jpg',
   ],
   host: '/host/4owYRmPxUp0qNEWBhGZI',
  ),
  CarModel(
   id: 'car2',
   name: 'Hyundai Elantra',
   carNumber: 'Cairo64512',
   availability: 'Available',
   price: 650,
   rate: 4.8,
   trips: 15,
   image: 'https://i.pinimg.com/originals/82/33/45/823345b8b1c587acb27b2b7c22b1b9f1.jpg',
   imagesUrl: [
    'https://i.pinimg.com/originals/82/33/45/823345b8b1c587acb27b2b7c22b1b9f1.jpg',
   ],
   host: '/host/4owYRmPxUp0qNEWBhGZI', pickupLocationModels: [],
  ),
  // 🟩 Add up to 8 cars here similarly
 ];

 for (var car in cars) {
  await carsCollection.doc(car.id).set(car.toJson());
 }

 print('✅ Cars added successfully!');
}