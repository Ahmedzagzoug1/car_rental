
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:hive/hive.dart';

import '../../../../../core/error/exceptions.dart';
import '../../models/brand_model.dart';

abstract class BrandsLocalDataSource {
  Future<List<BrandModel>> getCachedBrands();
  Future<void> cacheBrands(List<BrandModel> rands);

}


class BrandsLocalDataSourceImpl implements BrandsLocalDataSource {
  final Box<BrandModel> brandBox;

  BrandsLocalDataSourceImpl({required this.brandBox});


  @override
  Future<void> cacheBrands(List<BrandModel> brands) async {
    await brandBox.clear();
    final Map<dynamic, BrandModel> carMap = {
      for (var brand in brands) brand.brandName: brand
    };
    await brandBox.putAll(carMap);
  }

  @override
  Future<List<BrandModel>> getCachedBrands() async {
    if (brandBox.isEmpty) {
      throw EmptyCacheException();
    }
    return brandBox.values.toList();
  }
}