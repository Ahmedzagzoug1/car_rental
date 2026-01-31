import 'package:car_rental/core/error/exceptions.dart' show ServerException;
import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brands_remote_data_source.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/remote_data_source/brands_remote_data_source.dart';

class BrandRepositoryImplement implements BrandRepository{
 final BrandRemoteDataSource brandRemoteDataSource;
 const BrandRepositoryImplement({required this.brandRemoteDataSource});
  @override
  Future<Either<Failure,List<BrandEntity>>> getBrands() async{
    try{
    List<BrandModel>brands=await   brandRemoteDataSource.getBrands();
    List<BrandEntity> brandEntity= brands.map((brandModel)=>brandModel.toBrandEntity()).toList();
    return right(brandEntity);
    } on ServerException {
      return const Left(ServerFailure());
    } on Exception { // Catch any other unexpected exceptions
      return const Left(ServerFailure());
    }
  }

}