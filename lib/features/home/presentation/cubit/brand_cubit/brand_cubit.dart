import 'package:bloc/bloc.dart';
import 'package:car_rental/core/services/service_locators.dart';

import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:equatable/equatable.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  List<BrandEntity> brands = [];

  BrandCubit() : super(BrandInitial());

  getBrands() async {
    emit(BrandLoading());
    try {
   final   result = await sl<GetBrandsUsecase>().call();
         brands= result.fold((failure) {
        print('Folded Failure: ${failure.toString()}');
        return [];
      },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },);
      print('${brands.length}');

      emit(BrandLoaded(brands: brands));

    } catch (e) {
      emit(BrandFailure(e.toString()));
    }
  }
}