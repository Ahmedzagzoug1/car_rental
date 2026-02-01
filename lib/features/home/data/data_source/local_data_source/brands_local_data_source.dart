
import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:hive/hive.dart';

import '../../../../../core/error/exceptions.dart';
import '../../models/brand_model.dart';

abstract class BrandsLocalDataSource {
  Future<List<BrandModel>> getCachedBrands();
  Future<void> cacheBrands(List<BrandModel> brands);
  Future<int> getLastCacheTimestamp();
}


class BrandsLocalDataSourceImpl implements BrandsLocalDataSource {
  final Box<BrandModel> brandBox;
final Box brandCacheBox;
  static const _brandsCacheTimeKey = 'BRANDS_CACHE_TIME';

  BrandsLocalDataSourceImpl({required this.brandBox , required this.brandCacheBox});


  @override
  Future<void> cacheBrands(List<BrandModel> brands) async {
    await brandBox.clear();
    final Map<dynamic, BrandModel> carMap = {
      for (var brand in brands) brand.brandName: brand
    };
    await brandBox.putAll(carMap);
await brandCacheBox.put(_brandsCacheTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Future<List<BrandModel>> getCachedBrands() async {

    return brandBox.values.toList();
  }
  @override
  Future<int> getLastCacheTimestamp() async {
    return brandCacheBox.get(_brandsCacheTimeKey, defaultValue: 0);
  }
}