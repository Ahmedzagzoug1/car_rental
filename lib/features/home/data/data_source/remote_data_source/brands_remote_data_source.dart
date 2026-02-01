import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class BrandRemoteDataSource {
  Future<List<BrandModel>> getBrands();
}
class  BrandRemoteDataSourceImpl implements BrandRemoteDataSource{
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BrandModel>> getBrands() async {
    debugPrint('start get branding----');
    try {
      final snapshot = await _firestore.collection('brand').get();
      debugPrint(' get branding----');


      final data = snapshot.docs.map((doc) => doc.data()).toList();
      debugPrint('serization branding----');

      final brands =data.map((e) => BrandModel.fromJson(e)).toList();

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