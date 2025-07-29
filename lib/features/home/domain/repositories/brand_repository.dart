import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BrandRepository{
  Future<Either<Failure, List<BrandEntity>>> getBrands();

}