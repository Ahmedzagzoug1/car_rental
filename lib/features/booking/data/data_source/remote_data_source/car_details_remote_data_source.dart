import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/data/model/car_model.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/presentation/view/pages/car_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarDetailsRemoteDataSource{
  final _firebaseFirestore= sl<FirebaseFirestore>();

  Future< CarModel> getCarDetails(carId) async {
    print('$carId=================firebase');
    try {
      final querySnapShot =
      await _firebaseFirestore.collection('car').where('id',isEqualTo: carId).get();
      print('${querySnapShot.docs.first.data()}');
      print('${querySnapShot.docs.first.exists}');
      if (querySnapShot.docs.isEmpty) {
        throw NotFoundException();
      }
      final carDetails = CarModel.fromJson(querySnapShot.docs.first.data() );
      return carDetails;
    }catch(e){
      throw ServerException();
  }
  }
}