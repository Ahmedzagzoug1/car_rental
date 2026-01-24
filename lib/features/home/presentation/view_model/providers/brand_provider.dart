
import 'package:car_rental/core/shared_components/domain/usecase.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:flutter/foundation.dart';

enum  BrandState{ initial, loading, loaded, error }

class BrandProvider with ChangeNotifier {
  final GetBrandsUsecase _getBrandsUsecase ;

  BrandState _state = BrandState.initial;
  List<BrandEntity> _brands = [];
  String _errorMessage = '';

  BrandProvider(this._getBrandsUsecase);

  BrandState get state => _state;
  List<BrandEntity> get brands => _brands;
  String get errorMessage => _errorMessage;

  Future<void> fetchBrands() async {
  /*  _state = BrandState.loading;
print('fetch');
    notifyListeners();*/
   // await Future.delayed(Duration(seconds: 4));

    try {

print('star------------');
      _brands= (await _getBrandsUsecase.call(NoParams())).fold(    (failure) {
        print('Folded Failure: ${failure.toString()}');
        return []; // Default value on failure
      },
            (successValue) {
          print('Folded Success: $successValue');
          return successValue;
        },) ;
      print('${_brands.length}');

      _state = BrandState.loaded;
      notifyListeners();

    } catch (e) {
      _errorMessage = e.toString();
      _state = BrandState.error;
    } finally {
      notifyListeners();
    }
  }
}