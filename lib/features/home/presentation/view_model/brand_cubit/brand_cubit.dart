import 'package:bloc/bloc.dart';
import 'package:car_rental/core/shared_components/domain/usecase.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/brand_repository_implement.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:equatable/equatable.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  List<BrandEntity> brands = [];

  BrandCubit() : super(BrandInitial());

  getBrands() async {
    emit(BrandLoading());
    try {
      brands = (await GetBrandsUsecase(
          BrandRepositoryImplement(BrandRemoteDataSource()))
          .call(NoParams())).fold((failure) {
        print('Folded Failure: ${failure.toString()}');
        return []; // Default value on failure
      },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },);
      print('${brands.length}');

      emit(BrandLoaded());
     // return brands;
    } catch (e) {
      emit(BrandFailure(e.toString()));
    //  return [];
    }
  }
}