import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BrandRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BrandModel>> getBrands() async {
    final snapshot = await _firestore.collection('brand').get();

    // ناخد الداتا كـ List<Map>
    final data = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    // parsing في isolate
    final brands = await compute(parseBrands, data);

    print("Brands count: ${brands.length}");
    return brands;
  }
}

/// Top-level function لازم تكون sync
List<BrandModel> parseBrands(List<Map<String, dynamic>> data) {
  return data.map((e) => BrandModel.formJson(e)).toList();
}