import 'package:car_rental/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';

import '../../../../../core/services/service_locators.dart';
abstract class CarsRemoteDataSource {
  Future<List<CarModel>> getCars();
}
class  CarsRemoteDataSourceImpl implements CarsRemoteDataSource{
  final FirebaseFirestore _firestore = sl<FirebaseFirestore>();

  Future<List<CarModel>> getCars() async {
    debugPrint("Fetching cars...");
try {
  QuerySnapshot snapshot = await _firestore.collection('car').get();
  debugPrint('${snapshot.size} documents found');
  for (var doc in snapshot.docs) {
    debugPrint("Doc ID: ${doc.id}, data: ${doc.data()}");
  }
  final data = snapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  final cars = await compute(parseCars, data);

  return cars;
}catch (e){
throw ServerException();
}
  }
}

  List<CarModel> parseCars(List<Map<String, dynamic>> data) {
    return data.map((e) => CarModel.fromJson(e)).toList();
  }

