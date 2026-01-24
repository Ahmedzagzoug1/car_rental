import 'package:car_rental/core/shared_components/data/models/base_host_model.dart';
import 'package:car_rental/features/host/data/model/host_car_model.dart';
import 'package:car_rental/features/host/domain/usecases/get_host_cars_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteHostCarsDataSource{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<BaseHostModel>> getHostCars(GetHostCarParams getHostCarParams) async {
    // host id
    String hostId=getHostCarParams.hostId;

    QuerySnapshot snapshot = await _firestore.collection(
        'host/${hostId}/cars/').get();
    print('${snapshot.size}=============');
    return snapshot.docs.map((doc) {
      print('${doc.id}---------======================');
      print('${doc.get('')}---------======================');

      return BaseHostModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
  //order model
  }