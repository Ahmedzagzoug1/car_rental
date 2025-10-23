import 'package:car_rental/core/shared_components/data/models/car_model.dart';
import 'package:car_rental/features/home/data/models/cars_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class CarRemoteDataSource{
final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<CarsModel>> getCars() async {
  debugPrint("Fetching cars...");

  QuerySnapshot snapshot = await _firestore.collection('car').get();
  debugPrint('${snapshot.size} documents found');
  for (var doc in snapshot.docs) {
    debugPrint("Doc ID: ${doc.id}, data: ${doc.data()}");
  }
  final data = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

  final cars = await compute(parseCars, data);

  return cars;
}
// find car
}
List<CarsModel> parseCars(List<Map<String, dynamic>> data) {
  return data.map((e) => CarsModel.fromJson(e)).toList();
}