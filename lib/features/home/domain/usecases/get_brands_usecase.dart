


import 'dart:async';

import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/core/shared_components/domain/usecase.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cars_repository.dart';

class GetBrandsUsecase implements UseCase<List<BrandEntity>,NoParams>{
  BrandRepository brandRepository;

  GetBrandsUsecase(this.brandRepository);



  @override
  Future<Either<Failure,List< BrandEntity>> > call(NoParams) async {    // TODO: implement call
    return await brandRepository.getBrands(); // Delegates to the repository
  }
}