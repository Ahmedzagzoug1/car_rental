import 'package:car_rental/core/error/exceptions.dart' show ServerException, EmptyCacheException;
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../data_source/local_data_source/brands_local_data_source.dart';
import '../data_source/remote_data_source/brands_remote_data_source.dart';

class BrandRepositoryImplement implements BrandRepository{
 final BrandRemoteDataSource brandRemoteDataSource;
 final BrandsLocalDataSource brandsLocalDataSource;
 const BrandRepositoryImplement( {required this.brandRemoteDataSource ,required this.brandsLocalDataSource});
  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try {
      final brands = await brandsLocalDataSource.getCachedBrands();
      final ttl = await brandsLocalDataSource.getLastCacheTimestamp();
      final expired = _isTTLFinished(ttl);

      if (brands.isNotEmpty && !expired) {
        debugPrint('Returning cached brands: ${brands.length}');
        return Right(brands.map((e) => e.toEntity()).toList());
      }

      // cache empty or expired → get remote
      final remoteBrands = await brandRemoteDataSource.getBrands();
      await brandsLocalDataSource.cacheBrands(remoteBrands);
      debugPrint('Returning remote brands: ${remoteBrands.length}');
      return Right(remoteBrands.map((e) => e.toEntity()).toList());

    } catch (e, st) {
      debugPrint('Error in getBrands: $e');
      // fallback to cache if any
      try {
        final brands = await brandsLocalDataSource.getCachedBrands();
        if (brands.isNotEmpty) {
          debugPrint('Fallback cached brands: ${brands.length}');
          return Right(brands.map((e) => e.toEntity()).toList());
        }
      } catch (_) {}

      return const Left(ServerFailure());
    }
  }
 bool _isTTLFinished(int savedTimestamp) {
   if (savedTimestamp == 0) return true;

   const ttl = Duration(days: 7);

   final cacheTime =
   DateTime.fromMillisecondsSinceEpoch(savedTimestamp);

   return DateTime.now().difference(cacheTime) > ttl;
 }
}