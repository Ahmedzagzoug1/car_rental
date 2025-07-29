import 'package:car_rental/features/home/data/models/car_model.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CarRemoteDataSource{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<CarModel>> getCars() async{
    List<CarModel> cars=[];

                 await   _firestore.collection('car_model').get() .then((QuerySnapshot querySnapshot) {
                   querySnapshot.docs.forEach((doc) {
                    cars.add(doc.data() as CarModel);
                   });
                 }) ;

    return cars;
  }
}