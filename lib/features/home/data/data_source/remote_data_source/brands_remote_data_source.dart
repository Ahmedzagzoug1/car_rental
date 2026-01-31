import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BrandRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BrandModel>> getBrands() async {
    try {
      final snapshot = await _firestore.collection('brand').get();


      final data = snapshot.docs.map((doc) => doc.data()).toList();

      final brands = await compute(parseBrands, data);

      print("Brands count: ${brands.length}");
      return brands;
    }catch(e){
      throw ServerException();
    }
  }
}

List<BrandModel> parseBrands(List<Map<String, dynamic>> data) {
  return data.map((e) => BrandModel.fromJson(e)).toList();
}