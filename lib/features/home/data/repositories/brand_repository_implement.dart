import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:dartz/dartz.dart';

class BrandRepositoryImplement implements BrandRepository{
  BrandRemoteDataSource brandRemoteDataSource;
  BrandRepositoryImplement(this.brandRemoteDataSource);
  @override
  Future<Either<Failure,List<BrandEntity>>> getBrands() async{
    try{
    List<BrandModel>brands=await   brandRemoteDataSource.getBrands();
    List<BrandEntity> brand_entity= brands.map((brandModel)=>brandModel.toBrandEntity()).toList();
    return right(brand_entity);
    }catch(e){
    return  Left(ServerFailure(message: 'Failed to get Cars.'));
    }
  }

}