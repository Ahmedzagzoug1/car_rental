import 'package:car_rental/core/shared_components/data/models/base_car_model.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CarRemoteDataSource{
final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<BaseCarModel>> getCars() async {
  debugPrint("Fetching cars...");
  QuerySnapshot snapshot = await _firestore.collection('car').get();
  debugPrint('${snapshot.size} documents found');
  for (var doc in snapshot.docs) {
    debugPrint("Doc ID: ${doc.id}, data: ${doc.data()}");
  }
  return snapshot.docs.map((doc) {
    return BaseCarModel.fromJson(doc.data() as Map<String, dynamic>);
  }).toList();
}
// find car
}