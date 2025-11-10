


import 'dart:async';

import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cars_repository.dart';

class GetBrandsUsecase {
  BrandRepository brandRepository;

  GetBrandsUsecase(this.brandRepository);



  Future<Either<Failure,List< BrandEntity>> > call() async {
    return await brandRepository.getBrands(); // Delegates to the repository
  }
}